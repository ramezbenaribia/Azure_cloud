from typing import Any
from fastapi import APIRouter, HTTPException
from app.services.Blake2bClass import Blake2b
from pydantic import constr

router = APIRouter()


coder_service = Blake2b()

# by using FASTAPI we can easily sepicify what attributes we need like 'longURL'

# this endpoint is for encoding a long URL


@router.post(
    "/encode",
)
async def encode(
        longURL: constr(regex=r"^(http)s?://.+$"),
) -> Any:
    result = coder_service.encode(longURL)
    return {"result": result}

# this endpoint is for decoding a short URL and return the long URL


@router.post(
    "/decode",
)
async def decode(
        shortURL: str,
) -> Any:
    try:
        result = coder_service.decode(shortURL)
    # In case of an error where the URL hasn't been encoded before
    except:
        raise HTTPException(
            status_code=404, detail="Error! the URL can't be decoded since it's not encoded before")

    return {"result": result}
