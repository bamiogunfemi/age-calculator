import 'package:flutter/material.dart';

void main() => runApp(AgeCalc());

class AgeCalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.pinkAccent, Colors.indigo])),
        child: Center(child: AgeHome()),
      ),
    ));
  }
}

class AgeHome extends StatefulWidget {
  AgeHome({Key key}) : super(key: key);

  @override
  _AgeHomeState createState() => _AgeHomeState();
}

class _AgeHomeState extends State<AgeHome> {
  dynamic age = 0.0;
  int selectedMonth;
  int selectedDay;
  int selectedYear;
  var fullYear;
  dynamic curYear = new DateTime.now();
  void _showPicker() {
    showDatePicker(
            context: context,
            initialDate: new DateTime(2020),
            firstDate: new DateTime(1900),
            lastDate: DateTime.now())
        .then((DateTime dt) {
      setState(() {
        selectedYear = dt.year;
        selectedMonth = dt.month;
        selectedDay = dt.day;
        fullYear = '$selectedDay/$selectedMonth/$selectedYear';
        calAge();
      });
    });
  }

  void calAge() {
    setState(() {
      age = 2020 - selectedYear;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Colors.white,
          onPressed: () {
            _showPicker();
            print(curYear);
          },
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                selectedYear != null
                    ? 'How old Am I If I was Born On $fullYear ?'
                    : 'How old Am I If I was Born On DD/MM/YY ?',
                style: TextStyle(fontSize: 20.0, fontFamily: 'Montserrat')),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            selectedYear != null
                ? 'Looks Like You\'re ${age.toStringAsFixed(0)} years old'
                : '',
            style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
//TODO -padding round text and date.now instaed of 2020
