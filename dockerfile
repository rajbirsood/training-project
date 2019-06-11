FROM alpine
MAINTAINER <abc@gmail.com>
#FROM python:3.7
FROM python:2.7.9

env UBER_CLIENT_ID=UndlgDFo-x2K3muwcJFuP6fbIbgePNsZ
env UBER_CLIENT_SECRET=ez3pxRND2oI7cfNu6ST1Qr3E1hGVe-wKLo1kRn3_

COPY requirements.txt /tmp
COPY . /tmp
WORKDIR /tmp
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 7000

#RUN python app.py
COPY start.sh .
RUN chmod 755 start.sh


ENTRYPOINT ["sh","/tmp/start.sh"]