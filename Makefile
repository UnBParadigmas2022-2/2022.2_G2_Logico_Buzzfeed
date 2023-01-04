PROLOG = swipl -O

.PHONY: default
default: run

.PHONY: run
run:
	@ echo "--- Iniciando o jogo ---"
	$(PROLOG) -s src/main 
