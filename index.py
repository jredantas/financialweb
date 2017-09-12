# -*- coding: utf-8 -*-
"""
Spyder Editor

Este é um arquivo de script temporário.
"""

from flask import Flask, render_template, url_for
from flask import request, session, redirect

app = Flask(__name__)


#@app.route('/')
#def index():
#    return "It works !"

@app.route('/')
def accueil():
    return render_template('accueil.html', titre='Financial Web')

@app.route('/contact')
def contact():
    mail = "jrdantas@yahoo.com.br"
    tel = "55 85 99633"
    return "Mail: {} --- Tel: {}".format(mail, tel)

@app.route('/another')
def another():
    if 'username' in session:
        return render_template('accueil.html', titre='Financial Web')
        #return 'Logged in as %s' % escape(session['username'])
    #return alert
    return redirect(url_for('login'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        session['username'] = request.form['username']
        return redirect(url_for('index'))
    return render_template('login.html', titre='Financial Web - Login')


@app.route('/logout')
def logout():
    # remove the username from the session if it's there
    session.pop('username', None)
    return redirect(url_for('index'))

# set the secret key.  keep this really secret:
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'




if __name__ == '__main__':

    app.run(debug=True)
