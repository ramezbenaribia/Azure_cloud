# ShortLink Application

ShortLink is a URL shortening service

### To run this project there is two options

1. We can run it locally.
2. Or we can use docker to dockerize our project and run it.

Before starting we have to navigate to `ShortLink_Application` directory to interact with our project.
As we can see, there is an `app` directory that contains the endpoints for our project which is devided to two methods
`blake2b` and the `simple` method.\
And then we will find the `services` that we are going to use for our API.\
Finally, we have `tests` directory where we wrote all our test cases to evaluate our APIs.

## 1. For the first Option we can run those commands in the terminal:

### First of all we have to install the dependencies

NB: we can create a new venv environment or we can install the the dependencies globally in the machine

```console
pip3 install -r requirements.txt
```

### Now to run the project we can simply run the run_server.py file

```console
python3 run_server.py
```

Great, now after runing the project we can navigate to it and interact with our API throw the URL http://0.0.0.0:8007/ .
We will find the Swagger UI with our endpoints and we can easily test them throw the interface.\
NB: If we want to change the port or the host or even the name of the project we can change them in the `.env` file

## 2. For the second Option we can run those commands in the terminal

### We have two options here:

- we can build the docker image of our project and run it directly:

  ```console
  docker-compose up
  ```

- Or we can build the image first and then add the image to the container that we are going to run.\
  To do that first we have to build our image by typing this command:

  ```console
  docker build -t ramezbenaribia/finn:6.0 .
  ```

  Note: `ramezbenaribia/finn:6.0` is the name of the image so it can be anything else.

  Now, we have to delete or comment the `"build: . "` line and add our image to the container inside of the `docker-compose.yaml` file so:

  ```YAML
    build: .
  ```

  will be :

  ```YAML
  #build: .

  ```

  And

  ```YAML
  # image: ramezbenaribia/finn:6.0
  ```

  will be :

  ```YAML
  image: ramezbenaribia/finn:6.0
  ```

## 3. Finally to run the tests for this project we will have to run this command

```console
pytest
```

### To run a single test file like "test_blake2b.py" we can use this command

```console
pytest tests/endpoint_blake2b_tests/test_blake2b.py
```
