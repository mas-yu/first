#!/bin/bash

ClassTemplate="template2.py"
UtTemplate="test_template2.py"
suffix=".py"

author=`whoami`
ToDay=`date +"%d %b %Y"`

# (1) クラスフィル作成のためのチェック

# 環境変数にテンプレートフォルダが定義されていない
if [ "${myTemplatesDir}" = "" ]; then
  echo \"myTemplatesDir\" is not defined.
  exit
fi

# クラスファイルのテンプレートが存在しない
if [ ! -e ${myTemplatesDir}/${ClassTemplate} ]; then
  echo -e "\e[31m Error : Template of the python file (${ClassTemplate}) is not exist in \"${myTemplatesDir}\". \e[m"
  exit
fi

# 引数でクラス名が指定されていない
if [ $# -ne 1 ]; then
  echo -e "\e[31m Error : This script require a Class name. \e[m"
  exit
fi

# 指定したクラスファイルが存在する
if [ -e ./$1${suffix} ]; then
  echo -e "\e[31m Error : \"$1${suffix}\" is exist in this directory. \e[m"
  exit
fi

# (2) UTファイル作成のためのチェック

# UTファイルのテンプレートが存在しない
if [ ! -e ${myTemplatesDir}/${UtTemplate} ]; then
  echo -e "\e[31m Error : Template of the python ut file (${UtTemplate}) is not exist in \"${myTemplatesDir}\". \e[m"
  exit
fi

# 指定したクラスのUTファイルが存在する
if [ -e ./test_$1${suffix} ]; then
  echo -e "\e[31m Error : \"test_$1${suffix}\" is exist in the unit file directory. \e[m"
  exit
fi

# (3) ファイル作成
# クラスファイルを作成する
sed -e "s/@@MYNAME@@/${author}/" -e "s/@@DATE@@/${ToDay}/" -e "s/@@MYCLASS@@/$1/" ${myTemplatesDir}/${ClassTemplate}  > ./$1${suffix}
echo -e "\e[34m OK : \"$1${suffix}\" was created.\e[m"

# UTファイルを作成する
sed -e "s/@@MYNAME@@/${author}/" -e "s/@@DATE@@/${ToDay}/" -e "s/@@MYCLASS@@/$1/" ${myTemplatesDir}/${UtTemplate}  > ./test_$1${suffix}
echo -e "\e[34m OK : \"test_$1${suffix}\" was created in the UT directory.\e[m"
