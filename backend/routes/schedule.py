import os
from secrets import token_hex
import aiofiles
from fastapi import APIRouter, UploadFile
from schemas import schedule_schema



router = APIRouter(
    tags=['schedule'],
)

@router.post('/schedule')
async def CreatSchedule(response:schedule_schema.CreateSchedule):
    return response