#!/home/vagrant/anaconda/bin/python
# -*- coding: utf-8 -*-

u"""
Description of this file.
"""
__auther__  = "@@MYNAME@@"
__version__ = "0.00"
__date__    = "@@DATE@@"

from sys import argv
import unittest
from @@MYCLASS@@ import *

##### Unittet template ################
class @@MYCLASS@@Test(unittest.TestCase):
    u"""
    Description of this TestCases.
    """
     
    def setup(self):
        pass

    def test_myMethod(self):
        foo = @@MYCLASS@@()
        actual = foo.my_method(1)
        expected = 1
        self.assertEqual(actual, expected)

    def tearDown(self):
        pass

########################################
if __name__ == "__main__":
    unittest.main()  

