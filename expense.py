#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 20 15:11:39 2017

@author: 09959295800
"""


from sqlalchemy import Column, Integer, String, Float, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Expense(Base):
    __tablename__ = 'expense'

    id = Column(Integer, primary_key=True)
    company = Column(String)
    due_date = Column(DateTime)
    amount = Column(Float)
    installment_group = Column(Integer)
    installment = Column(Integer)
    account_id = Column(Integer)

""" One can use @property instead
    
    @property
    def x(self):
        return self.__x

    @x.setter
    def x(self, x):
        self.__x = x
"""