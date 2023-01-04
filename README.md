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

Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação

**Linguagens**: Prolog<br>
**Tecnologias**: xxxxxx<br>
Descreva os pré-requisitos para rodar o seu projeto e os comandos necessários.
Insira um manual ou um script para auxiliar ainda mais.
Gifs animados e outras ilustrações são bem-vindos!

## Uso

Existem duas principais maneiras de rodar esse projeto, a primeira utilizando o Dockerfile e a segunda o Makefile. Caso você não queira instalar o swipl diretamente em sua máquina, use o Docker. Porém, se você já tiver o swipl ou pretende instalar, use o comando `make`.

### Exemplo utilizando o Docker

Este repositório contém um Dockerfile para criar uma imagem Docker. Para usar a aplicação é necessário executar esta imagem.

#### Pré-requisitos

- O [Docker](https://www.docker.com/) deve estar instalado em sua máquina.

#### Criando a Imagem

Para criar a imagem Docker, execute o seguinte comando na raiz deste repositório:

```bash
docker build -t nome_da_imagem .
```

Isso criará a imagem com o nome nome_da_imagem. Você pode escolher qualquer nome desejar para a imagem.

#### Executando a Imagem

Para executar a imagem Docker, use o seguinte comando:

```bash
docker run -it nome_da_imagem
```

Isso iniciará um novo container baseado na imagem e abrirá um terminal no container.

### Exemplo utilizando o Makefile

#### Pré-requisitos

- [SWI-Prolog](https://www.swi-prolog.org/), o ambiente Prolog que será utilizado para rodar o programa.
- Comando `make`, disponível por padrão na maioria das distribuições linux.

#### Rodando o projeto

No diretório raiz, simplesmente digite o comando `make` em seu terminal. Caso você não possua o comando make, ainda é possível rodar o projeto diretamente digitando `swipl -O -s src/main`.

## Vídeo

Adicione 1 ou mais vídeos com a execução do projeto.
Procure:
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações

Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Fulano | Programação dos Fatos da Base de Conhecimento Lógica | Boa |

## Outros

Quaisquer outras informações sobre o projeto podem ser descritas aqui. Não esqueça, entretanto, de informar sobre:
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes

Referencie, adequadamente, as referências utilizadas.
Indique ainda sobre fontes de leitura complementares.
