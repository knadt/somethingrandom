FROM alpine:3.5
RUN apk add --update python py-pip
COPY requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt
COPY app.py .
COPY buzz ./buzz
CMD python ./app.py
