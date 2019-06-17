FROM alpine
MAINTAINER <abc@gmail.com>
#FROM python:3.7
FROM python:2.7.9

COPY requirements.txt /tmp
COPY . /tmp
WORKDIR /tmp
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

EXPOSE 7000

#RUN python app.py
COPY start.sh .
RUN chmod 755 start.sh


ENTRYPOINT ["python","/tmp/app.py","/bin/bash"]
#ENTRYPOINT /tmp/start.sh ; /bin/bash
