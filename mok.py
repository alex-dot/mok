from bottle import *
from bottle_sqlite import SQLitePlugin
from argon2 import argon2_hash
from Crypto import Random
from binascii import hexlify
import hashlib

install( SQLitePlugin( dbfile='./database.db' ) )

# login-system
@route('/login', template='login')
def login(db):
    logged_in = check_token( request.get_cookie("token"), db )
    return dict(login='no_info', logged_in=logged_in)
@route('/login', method='POST', template='login')
def do_login(db):
    logged_in = check_token( request.get_cookie("token"), db )
    username = request.forms.get('username')
    password = request.forms.get('password')

    user = db.execute('SELECT id,salt,password from users where username=?', (username,)).fetchone()
    if user == None:
        return dict(login='user_not_found', logged_in=logged_in)

    password = argon2_hash( password, user['salt'], buflen=32 )
    password = hexlify(password).decode()
    if password != user['password']:
        return dict(login='password_not_match', logged_in=logged_in)

    token_random = Random.get_random_bytes(32)
    token        = hexlify(token_random).decode()
    token_expiry = int(time.time()) + 3600
    db.execute('UPDATE users SET token=?,token_expiry=? WHERE id=?', (token, token_expiry, user['id']))

    response.set_cookie("token", token, max_age=3600, expires=token_expiry)
    # do max_age and expires really work?

    return dict(login='passed', logged_in=logged_in)
@route('/logout', template='login')
def logout(db):
    logged_in = check_token( request.get_cookie("token"), db )
    token = request.get_cookie("token")
    if token == None:
        return dict(login='already_logged_out', logged_in=logged_in)
    db.execute('UPDATE users SET token="",token_expiry=0 WHERE token=?', (token,))
    response.delete_cookie("token")
    return dict(login='logout', logged_in=logged_in)

def check_token(token, db=None):
    if db == None:
        return False
    db_token = db.execute('SELECT token, token_expiry FROM users WHERE token=?', (token,)).fetchone()
    if db_token == None:
        return False
    if db_token['token_expiry'] < int(time.time()):
        return False
    if db_token['token'] == token:
        return True
    return False


@route('/', template='page')
@route('/<pageid>', template='page')
def page(db, pageid='afrika-pflegt-europa'):
    logged_in = check_token( request.get_cookie("token"), db )

    # get the desired video
    video = db.execute('SELECT * FROM video WHERE urlname=?', (pageid,)).fetchone()
    if video == None:
        abort(404, "No video found")

    # get the categories...
    category_types = db.execute('SELECT * FROM category_type').fetchall()
    # ...and populate their values for the video
    categories = dict()
    for category in category_types:
        categories[ category['id'] ] = dict(
                category_title=category['title'],
                category_escaped_title=category['escaped_title'], 
                query=db.execute('\
                            SELECT cv.title,cv.escaped_title\
                            FROM video_category AS vc\
                            JOIN category_value AS cv ON vc.cvid=cv.id\
                            WHERE vc.vid=?\
                            AND cv.ctid=?', (video['id'],category['id'])).fetchall())
    return dict(name=pageid, video=video, categories=categories, logged_in=logged_in)

@route('/add', template='edit')
def add(db):
    logged_in = check_token( request.get_cookie("token"), db )
    if !logged_in:
        abort(401, 'You are not logged in')
    return dict(name=None, video=None, categories=None, logged_in=logged_in)

# static routes
@route('/img/<filename>')
def return_static_img(filename):
    return static_file(filename, root='./img/')
@route('/css/<filename>')
def return_static_css(filename):
    return static_file(filename, root='./css/')
@route('/js/<filename>')
def return_static_js(filename):
    return static_file(filename, root='./js/')
@route('/fonts/<filename>')
def return_static_fonts(filename):
    return static_file(filename, root='./fonts/')
@route('/video/<filename>')
def return_static_video(filename):
    return static_file(filename, root='./video/')

run(host='localhost', port=8080, debug=True)