
from flask import Flask
from flask_restful import Api
from flask_cors import CORS

from  mailer.sendEmailRequest import SendEmail

app = Flask(__name__)
cors = CORS(app, resources={r"/api/*": {"origins": "*"}})

prefix = "/api"
api = Api(app, prefix=prefix)


def index():
    return "hi"

app.add_url_rule("/","",index)
api.add_resource(SendEmail, '/mailer')

if __name__ == '__main__':
    from waitress import serve
    serve(app, host="0.0.0.0", port=8000)
