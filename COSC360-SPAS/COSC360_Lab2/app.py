#import modules from flask library
from flask import Flask, request

#Declare app
app = Flask(__name__)

@app.route('/')
#main page at localhost:5000/
def index():
    return 'Hello World, this is a Flask App!'

@app.route('/static-page')
#static html page at localhost:5000/static-page
def static_page():
    with open('static.html', 'r') as fp:
        return fp.read()

@app.route('/get-request')
#get request example page at localhost:5000/get-request?name=Jacob
def get_page():
    name = request.args.get('name', default=None, type = str)
    if name is not None:
        return "Hello " + name
    else:
        return "No name provided :("
#Run app
if __name__ == "__main__":
    app.run()