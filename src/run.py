#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 13 14:30:44 2017

@author: 09959295800
"""

# Run a test server.
from flask import Flask
import yaml

with open('config.yml', 'r') as file:
    config_data = yaml.safe_load(file)

app = Flask(__name__)

if __name__ == '__main__':
    
    app.run(host=config_data["app"]["host"], port=config_data["app"]["port"], debug=config_data["app"]["debug"])