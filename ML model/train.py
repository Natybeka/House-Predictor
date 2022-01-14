import pandas as pd
from sklearn.metrics import mean_absolute_error
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeRegressor
import joblib
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error


def trainMachine():
    # Path of the file to read
    iowa_file_path = './input/home_data/train.csv'

    home_data = pd.read_csv(iowa_file_path)
    # Create target object and call it y
    y = home_data.SalePrice
    # Create X
    features = ['LotArea', 'YearBuilt', '1stFlrSF',
                '2ndFlrSF', 'FullBath', 'BedroomAbvGr', 'TotRmsAbvGrd']
    X = home_data[features]
    print(X.head())

    # Split into validation and training data
    # This prevents overfitting and makes the model's predictions accurate
    train_X, val_X, train_y, val_y = train_test_split(X, y, random_state=1)

    # Specify Model
    iowa_model = RandomForestRegressor(random_state=1)
    # Fit Model
    iowa_model.fit(train_X, train_y)
    print(val_X.head())
    # Make validation predictions and calculate mean absolute error
    val_predictions = iowa_model.predict(val_X)
    val_mae = mean_absolute_error(val_predictions, val_y)
    print(
        "Validation MAE when not specifying max_leaf_nodes: {:,.0f}".format(val_mae))

    # Using best value for max_leaf_nodes
    iowa_model = DecisionTreeRegressor(max_leaf_nodes=100, random_state=1)
    iowa_model.fit(train_X, train_y)
    val_predictions = iowa_model.predict(val_X)
    val_mae = mean_absolute_error(val_predictions, val_y)
    print(
        "Validation MAE for best value of max_leaf_nodes: {:,.0f}".format(val_mae))

    # After the model is fitted save it into a file
    joblib.dump(iowa_model, "./models/model.pki")


if __name__ == "__main__":
    trainMachine()
