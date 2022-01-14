import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dropdowns",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ===================

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> displayedvalues = [null, null, null, null, null, null, null];
  int value;
  List<int> myparameters = [1000, 2000, 300, 300, 1, 1, 4];
  List<DropdownMenuItem<int>> lotarea,
      yearbuilt,
      firstfloorsqrft,
      secondfloorsqrft,
      noofbedrooms,
      bathrooms,
      totalrooms;

  final lotareavalues = {"1": 1000, "2": 2000, "3": 3000, "4": 4000, "5": 5000};
  final yearbuiltvalues = {
    "1": 2000,
    "2": 2005,
    "3": 2010,
    "4": 2015,
    "5": 2020
  };
  final firstfloorsqrftvalues = {
    "1": 300,
    "2": 600,
    "3": 900,
    "4": 1200,
    "5": 1500
  };
  final secondfloorsqrftvalues = {
    "1": 300,
    "2": 600,
    "3": 900,
    "4": 1200,
    "5": 1500
  };
  final noofbedroomsvalues = {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5};
  final bathroomsvalues = {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5};
  final totalroomsvalues = {"1": 4, "2": 5, "3": 6, "4": 7, "5": 8};

  List populatemenu(List<DropdownMenuItem<int>> menuitems, Map mymap) {
    menuitems = [];
    for (String key in mymap.keys) {
      menuitems.add(DropdownMenuItem<int>(
        child: Center(
          child: Text((mymap[key]).toString()),
        ),
        value: mymap[key],
      ));
    }
    return menuitems;
  }

  void secondselected(_value, int index) {
    setState(() {
      value = _value;
      displayedvalues[index] = _value;
      myparameters[index] = _value;
    });
    print(myparameters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Housing Price Predictor",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Lot Area: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Year Built: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "First Floor Sqr Ft: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Second Floor Sqr Ft: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "No. of Bedrooms: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Bathrooms: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Total Rooms: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "Predicted Price: ",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DropdownButton<int>(
                  items: populatemenu(lotarea, lotareavalues),
                  onChanged: (_value) => secondselected(_value, 0),
                  value: displayedvalues[0],
                  hint: Container(
                    child: Text("Select Lot Area"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(yearbuilt, yearbuiltvalues),
                  onChanged: (_value) => secondselected(_value, 1),
                  value: displayedvalues[1],
                  hint: Container(
                    child: Text("Select Year Built"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(firstfloorsqrft, firstfloorsqrftvalues),
                  onChanged: (_value) => secondselected(_value, 2),
                  value: displayedvalues[2],
                  hint: Container(
                    child: Text("Select First Floor Sqr Ft"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(secondfloorsqrft, secondfloorsqrftvalues),
                  onChanged: (_value) => secondselected(_value, 3),
                  value: displayedvalues[3],
                  hint: Container(
                    child: Text("Select Second Floor Sqr Ft"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(noofbedrooms, noofbedroomsvalues),
                  onChanged: (_value) => secondselected(_value, 4),
                  value: displayedvalues[4],
                  hint: Container(
                    child: Text("Select No. of Bedrooms"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(bathrooms, bathroomsvalues),
                  onChanged: (_value) => secondselected(_value, 5),
                  value: displayedvalues[5],
                  hint: Container(
                    child: Text("Select Bathrooms"),
                    width: 200,
                  ),
                ),
                DropdownButton<int>(
                  items: populatemenu(totalrooms, totalroomsvalues),
                  onChanged: (_value) => secondselected(_value, 6),
                  value: displayedvalues[6],
                  hint: Container(
                    child: Text("Select Total Rooms"),
                    width: 200,
                  ),
                ),
                Text(
                  "$value",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                ElevatedButton(
                  child: Text("Apply"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
