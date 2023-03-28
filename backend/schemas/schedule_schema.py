from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel

class TimeTypes(BaseModel):
    name:str
    class Config:
        orm_mode = True

class Timings(BaseModel):
     type:int
     class Config:
        orm_mode = True

class Indications(BaseModel):
    indication_name:str
    class Config:
        orm_mode = True

class Salts(BaseModel):
    salt_name:str
    class Config:
        orm_mode = True
class CreateSchedule(BaseModel):
    quantity:int
    dayorder:str
    name:str
    timings:List[Timings]
    salts:List[Salts]
    indications:List[Indications]
    class Config:
        orm_mode = True
