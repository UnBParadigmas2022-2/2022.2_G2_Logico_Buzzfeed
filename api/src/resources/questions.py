from flask_restful import Resource

class Questions(Resource):
    def get(self):
        return {
            "questions": [
                {
                    "num": 1,
                    "question": "Qual sua região preferida do Brasil?",
                    "options": [
                        "Norte", "Nordeste", "Sudeste", "Sul"
                    ]
                },
                {
                    "num": 2,
                    "question": "Qual sua cidade preferida no Brasil?",
                    "options": [
                        "Rio de Janeiro", "São Paulo", "Belo Horizonte", "Porto Alegre"
                    ]
                },
                {
                    "num": 3,
                    "question": "Qual sua cor preferida?",
                    "options": [
                        "Verde", "Branco", "Vermelho", "Azul"
                    ]
                },
                {
                    "num": 4,
                    "question": "O que mais te encanta?",
                    "options": [
                        "Posse de Bola", "Finalizações", "Contra-ataque", "Defesa Sólida"
                    ]
                },
                {
                    "num": 5,
                    "question": "Se você pudesse, com que frequência iria ao estádio?",
                    "options": [
                        "Todos os finais de semana, não importa o jogo", "Se não tivesse outro programa eu iria", "Apenas em decisões", "Não frequentaria muito os estádios"
                    ]
                },
            ]
        }
