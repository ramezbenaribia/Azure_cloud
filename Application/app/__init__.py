import os
# get the environment variable PROJECT_NAME
PROJECT_NAME = os.getenv("PROJECT_NAME", "ShortLink")


DATABASE_NAME = os.getenv("DATABASE_NAME", "shortlink-db")
CONTAINER_NAME = os.getenv("CONTAINER_NAME", "shortlink-items")

COSOMOS_DB_URI = os.getenv("COSOMOS_DB_URI")
COSOMOS_DB_KEY = os.getenv("COSOMOS_DB_KEY")
