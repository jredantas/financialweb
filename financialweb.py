# -*- coding: utf-8 -*-
"""
Spyder Editor

Developer: Jose Renato
created in 2017-09-11

"""

from flask import Flask, g
from flask import render_template, url_for
from flask import request, session, redirect

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import MetaData, Table

#from datetime import datetime

from contact import Contact
#from expense import Expense

app = Flask(__name__)

app.config.update(dict(
        DATABASE='nobdan',
        DEBUG=True,
        SECRET_KEY='_5#y2L"F4Q8z\n\xec]/A0Zr98j/3yX R~XHH!jmN]LWX/,?RT',
        USERNAME='admin',
        PASSWORD='admin'
    ))

#app.config.from_envvar('FLASKR_SETTINGS', silent=True)

# set the secret key.  keep this really secret:
app.secret_key = app.config.get('SECRET_KEY')

SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://'+app.config.get('USERNAME')+':'+app.config.get('PASSWORD')+'@localhost:3306/'+app.config.get('DATABASE')

#DBA section
def connect_db(conn_string=SQLALCHEMY_DATABASE_URI):
    """Connects to the specific database."""
    db = create_engine(conn_string)
    db.echo = False
    return db

def init_db():
    """Initializes the database."""
    INIT_DATABASE_URI = 'mysql+pymysql://'+app.config.get('USERNAME')+':'+app.config.get('PASSWORD')+'@localhost:3306/'
    db = get_db(INIT_DATABASE_URI)
    
    Session = sessionmaker(bind=db)
    session = Session()
    print('Create session variable.')

    # Open the .sql file
    sql_file = open('schema.sql','r')
    print('Open schema.sql.')
    # Create an empty command string
    sql_command = ''
    # Iterate over all lines in the sql file
    for line in sql_file:
        # Ignore comented lines
        if not line.startswith('--') and line.strip('\n'):
            # Append line to the command string
            sql_command += line.strip('\n')
            # If the command string ends with ';', it is a full statement
            if sql_command.endswith(';'):
                # Try to execute statemente and commit it
                try:
                    print(sql_command)
                    session.execute(sql_command)
                    session.commit()
                # Assert in case of error
                except Exception as err:
                    print(err)
                # Finally, clear command string
                finally:
                    sql_command = ''

def get_db(conn_string=SQLALCHEMY_DATABASE_URI):
    """Opens a new database connection if there is none yet for the
    current application context.
    """
    if not hasattr(g, 'sql_db'):
        g.sql_db = connect_db(conn_string)
    return g.sql_db

@app.cli.command('initdb')
def initdb_command():
    """Initializes the database."""
    init_db()
    print('Initialized the database.')

@app.teardown_appcontext
def close_db(error):
    """Closes the database again at the end of the request."""
    if hasattr(g, 'sql_db'):
        g.sql_db.dispose()

#Custom filters section
@app.template_filter('number')
def number_filter(s):
    try:
        float(s)
        return True
    except:
        return False

@app.template_filter('datetime')
def datetime_filter(d): # date = datetime object.
    try:
        d.strftime('%d/%m/%Y')
        return True
    except:
        return False

"""
                  <!--<td>{{ element[1].strftime('%d/%m/%Y') }}</td>
                  <td><span class="float-right">{{ element[2] }}</span></td>
                  <td><div class="col text-center">{{ element[3] }}</div></td>-->

"""        
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
    if len(session) == 0:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
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
    if session.get('logged_in') != True:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
    
    try:
        db = get_db()
        metadata = MetaData(bind=db)
        Session = sessionmaker(bind=db)
        sessiondb = Session()
        table = Table(str(instance), metadata, autoload=True)
        columns = []
        columnsStr = ''
        for i, key in enumerate(table.c.keys()):
            columns.append(key)
            columnsStr += key
            if i != len(table.c.keys()) -1:
                columnsStr += ', '
        columns = tuple(columns)
        sql = "SELECT {0} FROM {1}".format(columnsStr, table)
        result = sessiondb.query(*columns).from_statement(sql).all()
        print(result)
    except Exception as err:
        print(err)
        return render_template('accueil.html', titre='Financial Web', alert='It was not possible to retrieve the information. Please try again.')
    
    return render_template('list.html', titre='Financial web - '+instance, section_titre=instance, elements=result, columns=columns)
    
@app.route('/show/<instance>/<id>')
def show(instance, id):
    if session.get('logged_in') != True:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
    return render_template('show.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/insert/<instance>')
def insert(instance):
    if session.get('logged_in') != True:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
    return render_template('insert.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/remove/<instance>/<id>')
def remove(instance, id):
    if session.get('logged_in') != True:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
    return render_template('remove.html', titre='Financial web - '+instance, section_titre=instance)

@app.route('/update/<instance>/<id>')
def update(instance, id):
    if session.get('logged_in') != True:
        return render_template('accueil.html', titre='Financial Web', alert='User not logged in.')
    return render_template('update.html', titre='Financial web - '+instance, section_titre=instance)

#Model section
@app.route('/contact/add', methods=['POST'])
def insert_contact():
    if request.method == 'POST':
        try:
            db = get_db()
            Session = sessionmaker(bind=db)
            session = Session()
            contact = Contact(request.form['inputName'], request.form['inputEmail'], request.form['formControlMessage'])
            session.add(contact)
            session.commit()
            print('Contact inserted.')
            return render_template('accueil.html', titre='Financial Web', alert='Contact registered. Thank you.')
        except Exception as err:
            print(err)
            return render_template('accueil.html', titre='Financial Web', alert='Contact not registered. Try again.')

if __name__ == '__main__':

    app.run(host='0.0.0.0', port=8080, debug=True)
