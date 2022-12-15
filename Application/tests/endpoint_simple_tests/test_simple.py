from fastapi.testclient import TestClient

from app.main import app

from endpoint_simple_tests import LONG_URL, SHORT_URL, SHORT_URL_NON_EXISTENT

client = TestClient(app)

# this method is for testing the API of the Simple encoding method


def test_encode():
    response = client.post("/simple/encode", params={"longURL": LONG_URL})
    assert response.status_code == 200


# this method is for testing the API of the Simple decoding method
def test_decode():
    response = client.post("/simple/decode", params={"shortURL": SHORT_URL})
    assert response.status_code == 200
    assert response.json()["result"] == LONG_URL


# this method is for testing the API of the blake2b decoding method when the SHORT_URL dosen't exist
def test_decode_error_case():
    response = client.post(
        "/simple/decode", params={"shortURL": SHORT_URL_NON_EXISTENT})
    expected_error_message = "Error! the URL can't be decoded since it's not encoded before"
    assert response.status_code == 404
    assert response.json()["detail"] == expected_error_message
