import random
import string
from app.services.Blake2bClass import Blake2b


coder_service = Blake2b()
chars = string.ascii_letters + string.digits


# for testing the  Blake2b method we set the LONG_URL  and SHORT_URL variables first to test on them
LONG_URL = "https://codesubmit.io/library/react"
SHORT_URL = coder_service.encode(LONG_URL)


# this attribute is for testing the decode method when the SHORT_URL hasn't been encoded before
SHORT_URL_NON_EXISTENT = ''.join(random.choice(chars) for i in range(20))
