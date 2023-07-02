<h1 align="center">
  Portfolio Mailer
</h1>

<h2>api Send a thank-you email when trying to contact you and send an alert email to your personal email</h2>
<br><br>

# Run

##  create file **_.env_** and set value 

```.env
HOST=smtp.gmail.com
PORT=587
GMAIL=email@gmail.com
PASWWORD=app-password
BCCRECIPIENTS=email@gmail.com
```
> **_NOTE:_** can use any smtp server

<br>

## run app
```bash
pip install -r requirements.txt
python app.py
```