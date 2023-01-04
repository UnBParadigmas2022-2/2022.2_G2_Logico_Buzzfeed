FROM swipl:latest

WORKDIR /prolog

COPY . .

ENTRYPOINT ["swipl", "prolog/main.pl"]