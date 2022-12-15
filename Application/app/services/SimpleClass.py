import random
import string

from app.services import URI_SHORT_LINK
from fastapi import Request
from fastapi.encoders import jsonable_encoder


# This class is for the Simple method of encoding and decoding


class Simple:

    # urlDB is dictionary where the key is longUrl and the value is shortUrl
    # codeDB is dictionary where the key is shortUrl and the value is longUrl
    codeDB, urlDB = {}, {}
    chars = string.ascii_letters + string.digits

    def hash_to(self) -> str:
        code = ''.join(random.choice(self.chars) for i in range(6))
        return URI_SHORT_LINK + code

    # Encodes a URL to a shortened URL.
    async def encode(self, longUrl: str, request: Request) -> str:
        if longUrl in self.urlDB:
            return self.urlDB[longUrl]
        code = self.hash_to()
        while code in self.codeDB:
            code = self.hash_to()
        self.codeDB[code] = longUrl
        # item = {
        #     code: longUrl
        # }
        # item = jsonable_encoder(item)
        # new_todo = await request.app.shortlink_items_container.create_item(item)
        self.urlDB[longUrl] = code
        return code

    # Decodes a shortened URL to its original URL.
    def decode(self, shortUrl: str) -> str:
        return self.codeDB[shortUrl]
