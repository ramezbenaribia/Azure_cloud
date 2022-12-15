import hashlib
import string
from unittest import result

from app.services import URI_SHORT_LINK

# This class is for the blake2b method of encoding and decoding


class Blake2b:
    # urlDB is dictionary for saving the coded URLs and it's coded string
    urlDB = {}

    def hash_to(self, s):
        return URI_SHORT_LINK + hashlib.blake2b(key=s.encode(), digest_size=3).hexdigest()

    # Encodes a URL to a shortened URL.
    def encode(self, long_url: str) -> str:
        hash_key = self.hash_to(long_url)
        self.urlDB[hash_key] = long_url
        return hash_key

    # Decodes a shortened URL to its original URL.
    def decode(self, short_url: str) -> str:
        return self.urlDB[short_url]
