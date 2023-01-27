From python:3.8
USER root
RUN mkdir /app
COPY . /app/
WORKDIR /app
RUn pip3 install -r requirements.txt
# Now we'll use airflow
# so set env var for airflow
ENV AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW__CORE__DAGBAG_IMPORT_TIMEOUT=1000
ENV AIRFLOW__CORE__ENABLE_XCOM_PICKLING=True
RUN airflow db init 
# just like git init

RUN airflow users create  -e tandonsaurabh07@gmail.com -f Saurabh -l Tandon -p admin -r Admin  -u admin
RUN chmod 777 start.sh
RUN apt update -y && apt install awscli -y
# awscli is aws command line interfsace


# we are writing this to creae dockere image

ENTRYPOINT [ "/bin/sh" ]
CMD ["start.sh"]