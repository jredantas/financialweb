# -*- coding: utf-8 -*-
"""
Spyder Editor

Developer: Jose Renato
created in 2017-09-11

"""

from flask import Flask, render_template, url_for
from flask import request, session, redirect

app = Flask(__name__)

#Preambule section
@app.route('/')
def accueil():
    if 'username' in session:
       return render_template('accueil.html', titre='Financial web', username=session['username'])
    return render_template('accueil.html', titre='Financial web')

@app.route('/contact')
def contact():
    return render_template('contact.html', titre='Financial web - Contact us')

@app.route('/under_construction')
def under_construction():
    return render_template('under_construction.html', titre='Financial web')

#AUthentication section
@app.route('/signup')
def signup():
    return render_template('signup.html', titre='Financial web - Sign up')

@app.route('/profile')
def profile():
    print session
    return redirect(url_for('under_construction'))
    #return render_template('profile.html', titre='Financial web - User profile')

@app.route('/login', methods=['GET', 'POST'])
def login():
    username = request.form['username']
    if request.method == 'POST' and username == 'admin':
        session['username'] = username
        session['logged_in'] = True
        return redirect(url_for('accueil'))
    return render_template('accueil.html', titre='Financial Web', alert='Username or password not correct.')

@app.route('/logout')
def logout():
    # remove the username from the session if it's there
    session.pop('username', None)
    session.pop('logged_in', False)
    return redirect(url_for('accueil'))

#CRUD section
@app.route('/list/<instance>')
def hall(instance):
    #instance = request.args.get('instance')
    messages = ['um','dois','tres','quatro','5','6','7','8','9','10','11','12']
    return render_template('list.html', titre='Financial web - '+instance, section_titre=instance, elements=messages)

@app.route('/insert/<instance>')
def insert(instance):
    return render_template('insert.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/show/<instance>/<id>')
def show(instance, id):
    return render_template('show.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/remove/<instance>/<id>')
def remove(instance, id):
    return render_template('remove.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/update/<instance>/<id>')
def update(instance, id):
    return render_template('update.html', titre='Financial web - '+instance, section_titre=instance)


# set the secret key.  keep this really secret:
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'

if __name__ == '__main__':

    app.run(debug=True)
