from flask import Flask
from train import trainMachine
import os
app = Flask(__name__)

# training the model for the first time
if not os.path.isfile('./models/models.pki'):
    trainMachine()


@app.route("/predict", methods=['GET'])
def predict():

    checkForUpdatedData()
    return "<p>Hello, World!</p>"


# helper function for checking the updated data
# def checkForUpdatedData():
