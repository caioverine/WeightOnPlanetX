import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return HomeState();
  }
}
    
class HomeState extends State<Home> {

  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset('images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: Icon(Icons.person_outline)
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.brown
                      ),
                      Text("Pluto",
                        style: TextStyle(
                          color: Colors.white30
                        )
                      ),

                      Radio<int>(
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.red
                      ),
                      Text("Mars",
                        style: TextStyle(
                          color: Colors.white30
                        )
                      ),

                      Radio<int>(
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                        activeColor: Colors.orangeAccent,
                      ),
                      Text("Venus",
                        style: TextStyle(
                          color: Colors.white30
                        )
                      )
                    ]
                  ),

                  Padding(padding: EdgeInsets.all(15.6)),

                  Text(_weightController.text.isNotEmpty ? "$_formattedText lbs" : "Plese enter your weight",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }

  void handleRadioValueChanged(int value) {

    setState(() {

      radioValue = value;
      
      switch(radioValue) {
        case 0: //Pluto
          _finalResult = calculateWeight(_weightController.text, 0.06); // 0.06 is value for Pluto
          _formattedText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1: //Mars
          _finalResult = calculateWeight(_weightController.text, 0.38); // 0.38 is value for Mars
          _formattedText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2: //Venus
          _finalResult = calculateWeight(_weightController.text, 0.91); // 0.91 is value for Venus
          _formattedText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  double calculateWeight(String earthWeight, double planetValue){

    if(earthWeight.isNotEmpty && int.parse(earthWeight) > 0) {

      return int.parse(earthWeight) * planetValue;
    } else {

      print("wrong!");

      return int.parse(earthWeight) * 180.0;
    }
  }
}