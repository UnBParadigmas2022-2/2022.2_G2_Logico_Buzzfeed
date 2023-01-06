# BuzzFeed

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 02<br>
**Paradigma**: Lógico<br>

## Alunos

| Matrícula  | Aluno                             |
| ---------- | --------------------------------- |
| 19/0041871 | Abner Filipe Cunha Ribeiro        |
| 19/0102390 | André Macedo Rodrigues Alves      |
| 19/0012307 | Eduardo Afonso Dutra Silva        |
| 18/0018728 | Igor Batista Paiva                |
| 18/0033620 | João Henrique Cunha Paulino       |
| 16/0152615 | João Pedro Elias de Moura         |
| 18/0054554 | Paulo Batista                     |
| 19/0019158 | Rafael Leão Teixeira de Magalhães |
| 19/0020903 | Vitor Magalhães Lamego            |

## Sobre

O projeto baseaia-se nos testes criados e disponíveis na plataforma BuzzFeed. Os testes são formados por perguntas de multipla escolha (geralmente relacionadas a personalidade e opiniões do usuário) em que não existem alternativas certas ou erradas. O usuário deve responder todas as perguntas presentes no quizz e ao final as respostas são analisadas e o resultado que mais se encaixa no perfil do usuário é apresentado.

## Screenshots

### Tela inicial CLI

![Tela inicial CLI](assets/Screenshot_menu_inicial.png)

### Tela opções questões CLI

![Tela opções questões CLI](assets/Screenshot_menu_carregamento_questoes.png)

### Tela pergunta

![Tela pergunta](assets/Screenshot_menu_perguntas.png)

### Tela Inicial GUI

![Tela Inicial GUI](assets/Screenshot_tela_inicial_gui.jpg)

### Tela Pergunta GUI

![Tela Pergunta GUI](assets/Screenshot_tela_pergunta_gui.jpg)

### Tela Resultado GUI

![Tela Resultado GUI](assets/Screenshot_tela_resultado_gui.jpg)

## Instalação

**Linguagens**: Prolog e Python<br>
**Tecnologias**: XPCE e Flask<br>

## Uso

Existem duas principais maneiras de rodar esse projeto, a primeira utilizando o Dockerfile e a segunda o Makefile. Caso você não queira instalar o swipl diretamente em sua máquina, use o Docker. Porém, se você já tiver o swipl ou pretende instalar, use o comando `make`.

OBS: não é possível executar com a interface gráfica usando docker, será necessário utilizar o swipl (com o make), mas ainda é possível executar com a API executando com o docker.

### Exemplo utilizando o Docker

#### Pré-requisitos

- O [Docker](https://www.docker.com/) deve estar instalado em sua máquina.

#### Executando API e CLI

Para executar a API e a CLI com o docker é possível utilizar o script `start_all`, pode ser utilizado pelo make ou executando direto pelo bash.

```bash
make start_all
# OU
bash scripts/start_all.sh
```

#### Executando apenas a API

Para executar a API e a CLI com o docker é possível utilizar o script `start_api`.

```bash
make start_api
# OU
bash scripts/start_api.sh
```

#### Parando e removendo todos os containers

Para parar e remover todos os containers do docker é possível utilizar o script `stop_all`.

```bash
make stop_all
# OU
bash scripts/stop_all.sh
```

#### Parando e removendo o container da API

Para parar e remover apenas o container da API é possível utilizar o script `stop_api`.

```bash
make stop_api
# OU
bash scripts/stop_api.sh
```

#### Parando e removendo todos os containers e imagens

Para parar e remover todos os containers e imagens é possível utilizar o script `remove_all`.

```bash
make remove_all
# OU
bash scripts/remove_all.sh
```

#### Parando e removendo os containers e imagens da API

Para parar e remover apenas o container e imagem da API é possível utilizar o script `remove_api`.

```bash
make remove_api
# OU
bash scripts/remove_api.sh
```

### Exemplo utilizando o Makefile

#### Pré-requisitos

- [SWI-Prolog](https://www.swi-prolog.org/), o ambiente Prolog que será utilizado para rodar o programa.
- Comando `make`, disponível por padrão na maioria das distribuições linux.

#### Rodando o projeto

No diretório raiz, simplesmente digite o comando `make` em seu terminal. Caso você não possua o comando make, ainda é possível rodar o projeto diretamente digitando `swipl -O -s src/main`.

OBS: se desejar consumir perguntas da API, será necessário iniciar a API.

## Vídeo

O vídeo da apresentação pode ser acessado através do link: https://youtu.be/XoWBjAR9bE4.

## Participações

|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Abner Filipe Cunha Ribeiro | Atuei juntamente com o Rafael e o Eduardo na construção da interface gráfica no prolog. Inicialmente estudei mais a abordagem utilizando a biblioteca XPCE mas não obtendo muito sucesso, então optamos por primeiro implementarmos uma interface em java com swing que acabou sendo de base de tradução para XPCE que acabou sendo nossa versão final. | Excelente |
| André Macedo Rodrigues Alves | Trabalhei na construção do menu no terminal, trabalhei na lógica do quiz adicionando times, questões e fazendo algumas melhorias estruturais e correções juntamente com o João Henrique, configurei o Makefile pra rodar os scripts de inicialização do programa, ajustei os scripts para rodarem com o comando make e documentei as instruções sobre como rodar o projeto. Também fiz revisões de código e testes de funcionalidades. | Excelente |
| Eduardo Afonso Dutra Silva | Minha contribuição para o projeto foi trabalhar construindo a interface gráfica com a linguagem Prolog usando a biblioteca XPCE. Foram feitas basicamente três telas, uma tela inicial, uma tela para apresentar cada pergunta e suas alternativas e por último a tela que apresenta o resultado do quiz. | Excelente |
| Igor Batista Paiva | Minha contribuição geral no trabalho foi com revisões de PRs, testes das funcionalidades e edição do vídeo de apresentação. Em relação a desenvolvimento: implementei em Prolog a leitura das perguntas de um arquivo de texto, implementei em Prolog a leitura das perguntas de uma API; criei uma API que retorna perguntas em formato JSON utilizando o framework Flask em Python, criei scripts para executar a aplicação com docker (apenas a API ou API e container Prolog). | Excelente |
| João Henrique Cunha Paulino | Participei na criação da estrutura inicial do Dockerfile, que é usado na máquina dos desenvolvedores para criação do código, e na adição de alguns times para o projeto. Também auxiliei na busca de algumas funções para recuperar valores em uma lista nth0. Por fim, também encontrei uma maneira de fazer o editor de texto VIM reconhecer e ativar o syntax higlight na linguagem prolog. | Regular |
| João Pedro Elias de Moura | Minha contribuição foi com a adição da funcionalidade de adicionar mais times para ser utilizado como base do programa, assim como escrevê-la e salvá-la em um arquivo .txt. Ou seja, no menu do programa o usuário pode escolher adicionar mais times para aumentar a quantidade de opções de adivinhação. Essa funcionalidade, pergunta qual o nome do time que o usuário deseja adicionar e guarda ele em uma variável, assim como as perguntas subsequentes que servem para pegar as características daquele time e poder fazer a comparação de similaridade depois. Então, peguei essas características e as coloquei em uma lista, no formato que está sendo utilizado na funcionalidade principal do programa. Por fim, adicionei esse novo time a lista com os times já pré-existentes e salvei a lista em um arquivo. Falando sobre as dificuldades que encontrei, acredito que a principal foi no tratamento das listas, pois como a linguagem não trata de condicionais, looping e trabalhar com somente variáveis de ambiente, o que comumente as outras linguagens possuem, exigiu muito mais pensamento bem básico sobre como funcionam esses recursos das outras linguagens. E isso pra mim foi o maior aprendizado, já que devido a facilidade e gama de recursos que as linguagens orientada a objetos fornecem, acaba limitando o nosso pensamento e entrando em uma zona de conforto que não acredito ser boa. | Excelente |
| Paulo Batista | Eu contribuí para este projeto criando um programa em Prolog que implementa um jogo de quiz. O programa começa exibindo um menu com duas opções: iniciar o quiz ou sair do programa. Se o usuário escolher iniciar o quiz, o programa perguntará uma série de perguntas e, em seguida, usará as respostas para determinar qual time o usuário apoia. O programa também inclui uma lista de combinações possíveis de respostas e o time correspondente, e possui uma resposta padrão para quando não é encontrado nenhum resultado. O programa foi projetado para parar de procurar mais soluções depois de encontrar a primeira correspondência e para sair do programa após exibir a resposta final. Além de criar o programa de quiz, eu também contribuiu para a criação do docker.  | Excelente |
| Rafael Leão Teixeira de Magalhães | Participei do desenvolvimento da interface inicial do projeto, bem como do escalonamento da mesma para a versão final apresentada em conjunto com o Abner e o Eduardo. Tive dificuldades inicialmente com o estudo do xpce, então desenvolemos inicialmente uma interface em Java para servir de base para a tradução para o xpce | Boa |
| Vitor Magalhães Lamego | Minha contribuição para esse projeto se deu após as contribuições do Paulo. O Paulo construiu a base para o quizz que fizemos e percebi dois pontos de melhoria em que poderia atuar utilizando PROLOG. O primeiro ponto era que as respostas para cada pergunta estavam sendo armazenadas em diferentes variáveis, isto é, se existissem N perguntas, era necessário N variáveis, para isso construí uma lista para armazenar todas as respostas, que aumentava o seu tamanho conforme as respostas eram dadas. E a outra contribuição está relacionada a forma como a resposta estava sendo retornada ao usuário, anteriormente as respostas tinham que ser exatamente as mesmas da base de conhecimento, com isso em alguns casos o usuário não obtia uma resposta, para isso criei uma lógica de similaridade, onde o programa compara a lista de resposta do usuário com cada lista de resposta modelo na Base de Conhecimento e retorna a que tiver mais similaridade. | Excelente |


## Outros

Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes

- [Docker](https://www.docker.com/). Disponível em: https://www.docker.com/. Acesso em: 05 jan. 2023.
- [SWI-Prolog](https://www.swi-prolog.org/). Disponível em: https://www.swi-prolog.org/. Acesso em: 05 jan. 2023.
- [XPCE](https://www.swi-prolog.org/packages/xpce/). Disponível em: https://www.swi-prolog.org/packages/xpce/. Acesso em: 05 jan. 2023.
