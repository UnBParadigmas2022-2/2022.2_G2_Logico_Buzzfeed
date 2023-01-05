PROLOG = swipl -O

.PHONY: default
default: run

.PHONY: run
run:
	@ echo "--- Iniciando o jogo ---"
	QUESTIONS_API_URL=http://localhost:5000/questions $(PROLOG) -s src/main
