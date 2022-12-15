import uvicorn
import os

from dotenv import load_dotenv

# With this function we can load all the environment variables from a .env file
load_dotenv()
if __name__ == "__main__":
    PORT = os.getenv("PORT", "80")
    HOST = os.getenv("HOST", "0.0.0.0")

    # With this method we are going to run the server with a specific port and host
    uvicorn.run("app.main:app", host=HOST, port=int(PORT), reload=True)
