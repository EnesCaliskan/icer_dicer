import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icer Dicer'),
          backgroundColor: Colors.orange.shade300,
        ),
        body: DicePage(),
      ),
    ),
  );
}

final snackBar = SnackBar(
  content: Text('Çift Zar Atildi!'),
  duration: const Duration(seconds: 1),
  backgroundColor: Colors.orange.shade300,
);

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    ShakeDetector detectorLeft = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        leftDice = Random().nextInt(6) + 1;
        rightDice = Random().nextInt(6) + 1;
        Scaffold.of(context).showSnackBar(snackBar);
      });
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset('images/dice$leftDice.png'),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(
                child: Image.asset('images/dice$rightDice.png'),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                color: Colors.orange,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: Text(
                    'Tek Zar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Card(
                color: Colors.orange,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: Text(
                    'Çift Zar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
