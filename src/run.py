#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 13 14:30:44 2017

@author: 09959295800
"""

# Run a test server.
from flask import Flask

app = Flask(__name__)

if __name__ == '__main__':
    
    app.run(host='0.0.0.0', port=8080, debug=True)