#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 13 14:30:44 2017

@author: 09959295800
"""

# Statement for enabling the development environment
DEBUG = True

# Define the application directory
import os
BASE_DIR = os.path.abspath(os.path.dirname(__file__))  

# Define the database - we are working with
# SQLite for this example
username = 
SQLALCHEMY_DATABASE_URI = 'mysql://'+username+':'+password'@localhost/jrassysdb'
DATABASE_CONNECT_OPTIONS = {}

# Application threads. A common general assumption is
# using 2 per available processor cores - to handle
# incoming requests using one and performing background
# operations using the other.
THREADS_PER_PAGE = 2

# Enable protection agains *Cross-site Request Forgery (CSRF)*
CSRF_ENABLED     = True

# Use a secure, unique and absolutely secret key for
# signing the data. 
CSRF_SESSION_KEY = "A0Zr98j/3yX R~XHH!jmN]LWX/,?RT"

# Secret key for signing cookies
SECRET_KEY = "A0Zr98j/3yX R~XHH!jmN]LWX/,?RT"