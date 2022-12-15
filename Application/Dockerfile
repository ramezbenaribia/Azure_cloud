FROM python:3.7.6

WORKDIR /app/

# We need to copy the requirements so we can download the dependencies of our project
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

# We need to copy the project and the run_server file to run it 
COPY ./app /app/app
COPY ./run_server.py /app/run_server.py

EXPOSE 80

#  this command will be executed when we run our docker image
CMD ["python3", "run_server.py"]

