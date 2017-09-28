#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 19 18:23:59 2017

@author: 09959295800
"""

from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from passlib.hash import sha256_crypt

Base = declarative_base()

class Person(Base):
    __tablename__ = 'person'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    company = Column(String)
    email = Column(String)
    passwd = Column(String)

    def __init__(self, name, company, email, passwd):
        self.name = name
        self.email = email
        self.company = company
        self.passwd = sha256_crypt.encrypt(passwd)
