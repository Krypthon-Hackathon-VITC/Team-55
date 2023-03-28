from secrets import token_hex
import uuid
from sqlalchemy import Column, Enum, Float, Integer, String, Boolean, DateTime, ForeignKey
from database import Base
from datetime import datetime
from sqlalchemy.orm import relationship


def generate_uuid():
    return token_hex(16)

class Customers(Base):
    __tablename__ = 'customers'

    customer_id = Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    first_name = Column(String)
    last_name = Column(String)
    email = Column(String,unique=True)
    phone_number = Column(Integer,unique=True)
    gender = Column(String)
    dob = Column(DateTime)
    fcm_token = Column(String)
    firebase_id = Column(String,unique=True)
    date_created = Column(DateTime, default=datetime.now())
    last_login = Column(DateTime)
    is_active = Column(Boolean)
    height=Column(String)
    weight=Column(String)
    profile_url= Column(String)
    is_active= Column(Boolean)
    last_login=Column(DateTime)

class Salts(Base):
    __tablename__="salts"
    salt_id=Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    salt_name=Column(String)
    schedule= Column(Integer, ForeignKey('schedules.id'))
    schedule = relationship('Schedules', back_populates='salts')


class TimeTypes(Base):
    __tablename__="timetypes"
    time_type_id=Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    name=Column(String)
    
    
class Indications(Base):
    __tablename__="indications"
    indication_id=Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    indication_name=Column(String)
    schedule= Column(Integer, ForeignKey('schedules.id'))
    schedule = relationship('Schedules', back_populates='salts')

class Timings(Base):
    __tablename__="timings"

    time_id=Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    type= Column(Integer, ForeignKey('timetypes.time_type_id'))
    schedule = relationship('Schedules', back_populates='salts')
    

    
class Schedules(Base):
    __tablename__="schedules"

    id= Column(Integer, primary_key=True,
                         index=True, autoincrement=True)
    quantity=Column(Integer)
    dayorder=Column(String)
    name=Column(String)
    timings = relationship('Timings', back_populates='schedule')
    salts = relationship('Salts', back_populates='schedule')
    indications= relationship('Indications', back_populates='schedule')


