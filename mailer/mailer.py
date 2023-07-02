from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from dotenv import load_dotenv
from os.path import join, dirname
import os

class Mailer:
    def __init__(self) -> None:
        dotenv_path = join(dirname(__file__), '.env')
        load_dotenv(dotenv_path=dotenv_path)

        self.smtp_server = os.getenv('HOST')
        self.smtp_port =  os.getenv('PORT')
        self.smtp_username = os.getenv('GMAIL')
        self.smtp_password = os.getenv('PASWWORD')
        self.bcc_email = os.getenv('BCCRECIPIENTS')
        
        self.server = smtplib.SMTP(host=self.smtp_server, port=self.smtp_port)
        self.server.connect(host=self.smtp_server, port=self.smtp_port)
        self.server.ehlo()
        self.server.starttls()
        self.server.ehlo()
        self.server.login(self.smtp_username, self.smtp_password)
    
    def sendUser(self, sendersName:str, yourName:str, emailTo:str)-> None:
        
        message = MIMEMultipart("alternative")
        message['Subject'] = "Thank You for Contacting Us"
        message['From'] = self.smtp_username
        message['To'] = emailTo
        message['Cc'] = self.bcc_email
        
        body = MIMEText(self.__useMessage(sendersName =sendersName, yourName=yourName), "html")
        message.attach(body)
        
        self.server.sendmail(self.smtp_username, emailTo, message.as_string())
    
    def sendMy(self, name:str, emailTo:str, subject:str, userMessage:str)-> None:
        
        message = MIMEMultipart("alternative")
        message['Subject'] = "Thank You for Contacting Us"
        message['From'] = self.smtp_username
        message['To'] = self.bcc_email
        body = MIMEText(self.__messageMy(name,emailTo,subject,userMessage), "html")
        message.attach(body)
        
        self.server.sendmail(self.smtp_username, self.bcc_email, message.as_string())
    
    def quit(self):
        self.server.quit()
      
    def __messageMy(self,name,emailTo,subject,message):
        html = f"""\
        <html>
        <body>
            <h4>Name: {name}</h4>
            <h4>Email: {emailTo}</h4>
            <h4>Subject: {subject}</h4>
            <h4>Message: {message}</h4>
        </body>
        </html>
        """
        return html
    def __useMessage(self, sendersName,  yourName):
        return """
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
  <title>Thank You for Contacting Us</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 600px;
      margin: 0 auto;
      background-color: #ffffff;
      padding: 40px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 24px;
      color: #333333;
      margin-bottom: 20px;
    }

    p {
      font-size: 16px;
      color: #666666;
      line-height: 1.5;
      margin-bottom: 10px;
    }

    .signature {
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Thank You for Contacting Us</h1>
    <p>Dear %s,</p>
    <p>Thank you for reaching out to me. I truly appreciate your contact and the time you've taken to send me an email.</p>
    <p>I am looking forward to the opportunity to assist you and address any questions you may have. Should you have any further inquiries, please do not hesitate to contact me again.</p>
    <p>Once again, I want to express my gratitude for reaching out to me, and I am fully committed to meeting your needs.</p>
    <p class="signature">Best regards,<br>%s</p>
  </div>
</body>
</html>
"""%(sendersName, yourName)