from datetime import datetime

from fastapi import FastAPI
from starlette.middleware.gzip import GZipMiddleware
from fastapi import FastAPI
from azure.cosmos.aio import CosmosClient
from azure.cosmos import PartitionKey, exceptions
from datetime import datetime

from fastapi import FastAPI
from starlette.middleware.gzip import GZipMiddleware


from app import PROJECT_NAME, DATABASE_NAME, CONTAINER_NAME, COSOMOS_DB_URI, COSOMOS_DB_KEY


from app.api.api import api_router


now = datetime.now()

# We can add a title to our Swagger UI like the project name and the current time
sub_app = FastAPI(
    title=PROJECT_NAME + ' ' + now.strftime("%d/%m/%Y %H:%M:%S"),
    openapi_url=f"/openapi.json",
    docs_url=f"/", redoc_url=f"/",
)

sub_app.add_middleware(GZipMiddleware, minimum_size=1000)

# this method is for including  the router that we are going to use for sending our requests  to the APP
sub_app.include_router(api_router, prefix="")

# this method is for including  the router that we are going to use for sending our requests  to the APP


@ sub_app.on_event("startup")
async def startup_db_client():
    app.cosmos_client = CosmosClient(COSOMOS_DB_URI, COSOMOS_DB_KEY)
    await get_or_create_db(DATABASE_NAME)
    await get_or_create_container(CONTAINER_NAME)


async def get_or_create_db(db_name):
    try:
        app.database = app.cosmos_client.get_database_client(db_name)
        return await app.database.read()
    except exceptions.CosmosResourceNotFoundError:
        print("Creating database")
        return await app.cosmos_client.create_database(db_name)


async def get_or_create_container(container_name):
    try:
        app.shortlink_items_container = app.database.get_container_client(
            container_name)
        return await app.shortlink_items_container.read()
    except exceptions.CosmosResourceNotFoundError:
        print("Creating container with id as partition key")
        return await app.database.create_container(id=container_name, partition_key=PartitionKey(path="/id"))
    except exceptions.CosmosHttpResponseError:
        raise


app = sub_app
