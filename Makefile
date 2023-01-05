PROLOG = swipl -O

.PHONY: default
default: run

.PHONY: run
run:
	@ echo "--- Iniciando o jogo ---"
	QUESTIONS_API_URL=http://localhost:5000/questions $(PROLOG) -s src/main

.PHONY: start_all
start_all:
	bash ./scripts/start_all.sh

.PHONY: start_api
start_api:
	bash ./scripts/start_api.sh

.PHONY: stop_all
stop_all:
	bash ./scripts/stop_all.sh

.PHONY: stop_api
stop_api:
	bash ./scripts/stop_api.sh

.PHONY: remove_all 
remove_all:
	bash ./scripts/remove_all.sh

.PHONY: remove_api 
remove_api:
	bash ./scripts/remove_api.sh
