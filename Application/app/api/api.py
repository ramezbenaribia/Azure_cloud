from fastapi import APIRouter
from app.api.endpoints import blake2b_method

from app.api.endpoints import simple_method

api_router = APIRouter()

# the router is going to be divided in two routes where each route uses a specific method for encoding and decoding

# the prefix for this route is simple where we are using the simple method for encoding and decoding
api_router.include_router(simple_method.router,
                          prefix="/simple", tags=["Simple Method"])

# the prefix for this route is blake2b where we are using the blake2b method for encoding and decoding
api_router.include_router(
    blake2b_method.router, prefix="/blake2b", tags=["Blake2b Method"])
