FROM swipl:latest

WORKDIR /prolog

COPY . .

ENTRYPOINT ["swipl", "src/main.pl"]