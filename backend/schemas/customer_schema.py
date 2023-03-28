from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel


class CustomerLogin(BaseModel):
    first_name: str
    last_name: str
    email: str 
    phone_number: int
    fcm_token: Optional[str] = None
    firebase_id: Optional[str] = None
    is_active: bool = True
    last_login: Optional[datetime]