#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 19 18:23:59 2017

@author: 09959295800
"""

from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()


class Contact(Base):
    __tablename__ = "contact"

    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)
    message = Column(String)

    def __init__(self, name, email, message):
        self.name = name
        self.email = email
        self.message = message
