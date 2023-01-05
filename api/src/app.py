from flask import Flask
from flask_restful import Api
from src.resources.questions import Questions


def create_app():
    """
    Create the Flask app
    """
    app = Flask(__name__)

    api = Api(app)

    # FIXME: Create routes file
    api.add_resource(Questions, "/questions")

    return app, api
