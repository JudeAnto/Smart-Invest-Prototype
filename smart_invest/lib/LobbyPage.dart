import 'package:flutter/material.dart';
//import 'globals.dart';

class LobbyPage extends StatelessWidget {
  Widget buttonFunc(BuildContext context, String buttonName) {
    return SizedBox(
      width: 125, // specific value
      child: RaisedButton(
        onPressed: () {},
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: 125,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: SafeArea(
      child: Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Smart \nInvest',
              style: TextStyle(
                fontSize: 60,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.blue[700],
              ),
            ),
            Padding(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buttonFunc(context, 'LEARN'),
                  buttonFunc(context, 'PRACTICE'),
                ],
              ),
              padding: const EdgeInsets.only(top: 150),
            ),
          ],
        ),
      ),
    ));
  }
}
