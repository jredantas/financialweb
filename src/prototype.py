from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine


SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:admin@localhost:3306/nobdan'

db = create_engine(SQLALCHEMY_DATABASE_URI)

Base = declarative_base(db)

stored={}
stored['tablename']='expense'
stored['objectname']='MyObject'

mydict={'__tablename__':stored['tablename'],
        '__table_args__':{'autoload':True},}

MyObj=type(stored['objectname'],(Base,),mydict)
print(MyObj)
# <class '__main__.MyObject'>
print(MyObj.__base__)
# <class '__main__.Base'>
print(MyObj.__tablename__)
# my_internal_table_name
print(MyObj.__table_args__)
# {'autoload': True}
