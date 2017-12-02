#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 19 18:23:59 2017

@author: 09959295800
"""

from sqlalchemy import Column, Integer, String, Date, Numeric, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import ForeignKey
from sqlalchemy.orm import relationship
from passlib.hash import sha256_crypt

Base = declarative_base()

class Contact(Base):
    __tablename__ = 'contact'

    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)
    message = Column(String)

    def __init__(self, name, email, message):
        self.name = name
        self.email = email
        self.message = message
        
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


class Expense(Base):
    __tablename__ = 'expense'

    id = Column(Integer, primary_key=True)
    company = Column(String)
    due_date = Column(Date)
    amount = Column(Numeric)
    installment = Column(Integer)
    installment_group = Column(Integer)
    account_id = Column( Integer, ForeignKey( 'account.id' ), primary_key = True )
    group1 = Column(String)
    group2 = Column(String)
    username = Column(String)
    private = Column(Boolean)

    def __init__(self, id, company, due_date, amount, installment, installment_group, account_id, group1, group2, username, private):
        self.id = id
        self.company = company
        self.due_date = due_date
        self.amount = amount
        self.installment = installment
        self.installment_group = installment_group
        self.account_id = account_id
        self.group1 = group1
        self.group2 = group2
        self.username = username
        self.private = private
        
class Income(Base):
    __tablename__ = 'income'

    id = Column(Integer, primary_key=True)
    company = Column(String)
    pay_date = Column(Date)
    amount = Column(Numeric)
    account_id = Column( Integer, ForeignKey( 'account.id' ), primary_key = True )
    description = Column(String)
    typeof = Column(String)
    username = Column(String)
    private = Column(Boolean)

    def __init__(self, id, company, pay_date, amount, account_id, description, typeof, username, private):
        self.id = id
        self.company = company
        self.pay_date = pay_date
        self.amount = amount
        self.account_id = account_id
        self.description = description
        self.typeof = typeof
        self.username = username
        self.private = private

class Account(Base):
    __tablename__ = 'account'

    id = Column(Integer, primary_key=True)
    description = Column(String)
    type = Column(Integer)
    expenses = relationship(Expense)

    def __init__(self, id, description, type):
        self.id = id
        self.description = description
        self.type = type

