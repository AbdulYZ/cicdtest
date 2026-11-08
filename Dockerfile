
FROM debian:forky-20251020

WORKDIR /application

RUN apt-get update && apt-get install -y python3 python3-pip

COPY src/server.py .
COPY src/requirements.txt .
COPY src/app.txt .

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
