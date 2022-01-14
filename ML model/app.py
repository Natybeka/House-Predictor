from flask import Flask, request
from train import trainMachine
from sklearn.datasets import make_blobs
import os
import pandas as pd
import numpy as np
import joblib
app = Flask(__name__)

# training the model for the first time
if os.path.isfile('./models/models.pki') == False:
    trainMachine()


@app.route("/predict", methods=['POST'])
def predict():
    jsonData = request.json

    features = pd.array(['LotArea', 'YearBuilt', '1stFlrSF',
                         '2ndFlrSF', 'FullBath', 'BedroomAbvGr', 'TotRmsAbvGrd'])
    iowa_model = joblib.load("./models/model.pki")
    data_input = [[jsonData["LotArea"],
                  jsonData["YearBuilt"], jsonData["1stFlrSF"],
                  jsonData["2ndFlrSF"], jsonData["FullBath"],
                  jsonData["BedroomAbvGr"], jsonData["TotRmsAbvGrd"]]]

    data_input = pd.array(data_input, dtype=np.dtype("int32"))

    print(data_input)

    predicted_sale_price = iowa_model.predict(data_input)

    print(predicted_sale_price)
    # checkForUpdatedData()
    return "predicted_sale_price", 200


# helper function for checking the updated data
# def checkForUpdatedData():
