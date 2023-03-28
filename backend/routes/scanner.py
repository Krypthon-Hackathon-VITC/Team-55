import os
from secrets import token_hex
import aiofiles
from fastapi import APIRouter, UploadFile



router = APIRouter(
    tags=['scanner'],
)

@router.post('/scan')
async def scanner(image:UploadFile):
    filename = token_hex(16)
    async with aiofiles.open(f'images/{filename}.jpeg', 'wb') as out_file:
            content = await image.read()  # async read
            await out_file.write(content)  # async write
    os.remove(f'images/{filename}.jpeg')
    return filename