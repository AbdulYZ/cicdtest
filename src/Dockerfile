FROM debian:forky-20251020

WORKDIR /application

COPY /server.py .
COPY /requirements.txt .

RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install --break-system-packages -r requirements.txt

RUN mkdir -p /application/data


RUN useradd \
    --user-group \
    --system \
    --home-dir /nonexistent \
    --shell /sbin/nologin \
    --no-create-home \
    --uid 1000 \
    application

RUN chown -R application:application /application

USER application

EXPOSE 5000

CMD ["python3", "server.py"]
