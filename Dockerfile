FROM python:3.9-bullseye
WORKDIR /usr/src/app
COPY ./catalog /usr/src/app/catalog
COPY ./locallibrary /usr/src/app/locallibrary
COPY ./manage.py /usr/src/app
COPY entrypoint.sh /usr/src/app
RUN apt-get update
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 5000
RUN ["chmod","+x","/usr/src/app/entrypoint.sh"]
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]