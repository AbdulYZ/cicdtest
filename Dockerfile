FROM debian:latest

WORKDIR /a3

RUN apt-get update && apt-get install -y python3 python3-pip 

COPY src/server.py .
COPY src/requirements.txt .
COPY src/app.txt .

RUN pip3 install --break-system-packages -r requirements.txt

RUN mkdir -p /a3/data

RUN useradd \
    --user-group \
    --system \
    --home-dir /nonexistent \
    --shell /usr/sbin/nologin \
    --no-create-home \
    --uid 1000 \
    appuser

RUN chown -R appuser:appuser /a3

USER appuser

EXPOSE 5000

CMD ["python3", "server.py"]
