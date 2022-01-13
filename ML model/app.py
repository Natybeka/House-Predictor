from flask import Flask

app = Flask(__name__)


@app.route("/predict", methods=['GET'])
def predict():

    checkForUpdatedData()
    return "<p>Hello, World!</p>"


# helper function for checking the updated data
def checkForUpdatedData():
