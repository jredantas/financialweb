#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Sep 11 16:43:08 2017

@author: 09959295800
"""

from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return "It works!"

@app.route('/contact/')
def contact():
    mail = "jrdantas@yahoo.com.br"
    tel = "55 85 99633"
    return "Mail: {} --- Tel: {}".format(mail, tel)

if __name__ == '__main__':
    app.run(debug=True)