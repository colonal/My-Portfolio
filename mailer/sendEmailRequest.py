from flask_restful import Resource
from flask import request
from  mailer.mailer import Mailer



class SendEmail(Resource):
    def __init__(self) -> None:
        super().__init__()
        
    def post(self):
        try:
            message = ""
            args = request.json
            if args.get("sendersName") == None:
                message += "sendersName Not Found\n"
            if args.get("yourName") == None:
                message += "yourName Not Found\n"
            if args.get("emailTo") == None:
                message += "emailTo Not Found"
            
            if len(message):
                return {"state": "Failure", "message":message}, 400
            
            mailer = Mailer()
            mailer.sendUser(
                sendersName=args.get("sendersName"),
                yourName=args.get("yourName"),
                emailTo=args.get("emailTo")
                )
            mailer.sendMy(
                name=args.get("sendersName"),
                emailTo=args.get("emailTo"),
                userMessage=args.get("userMessage"),
                subject=args.get("subject"),
            )
            
            mailer.quit()
            
            return {"state": "Success"}, 200
        except Exception as e:
            self._LOGGER.error(f"ERROR: {e}")
            return {"state": f"Failure: {e}"}, 500