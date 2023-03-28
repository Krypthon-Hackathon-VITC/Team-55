
from datetime import datetime
from typing import List
from fastapi import APIRouter, Depends, HTTPException
import models
from database import SessionLocal, get_db
from schemas import customer_schema



router = APIRouter(
    tags=['customer'],
)

@router.post("/customer")
def customers(request : customer_schema.CustomerLogin,db: SessionLocal = Depends(get_db)):
    check_user = db.query(models.Customer).filter(models.Customer.email == request.email).first()
    if not check_user:
        customer = models.Customer(**request.dict())
        db.add(customer)
        db.commit()
        db.refresh(customer)
        cart_db = models.Cart(customer_id=customer.customer_id, date_created=datetime.now())
        db.add(cart_db)
        db.commit()
        db.refresh(cart_db)
        return customer
    else:
        user_object = {
           "firebase_id" : request.firebase_id,
           "last_login" : datetime.now()
        }
        check_user = db.query(models.Customer).filter(models.Customer.email == request.email).update(user_object)
        db.commit()
        return {"auth" : "updated",
        "response":user_object}