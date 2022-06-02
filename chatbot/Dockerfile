FROM python:3.8-slim

RUN python -m pip install rasa 

WORKDIR /app
COPY . .

RUN rasa train --config config.yml --domain domain.yml --data data --out models

USER 1001

ENTRYPOINT [ "rasa" ]

CMD [ "run", "--enable-api", "--port","80" ]
