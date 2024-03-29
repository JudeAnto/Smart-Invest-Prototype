import 'package:flutter/material.dart';
import 'LobbyPage.dart';
import 'LearnPage.dart';
import 'PracticeNavigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LobbyPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/learn_page': (context) => LearnPage(title: 'Tutorials'),
        '/practice_navigation' : (context) => PracticeNavigation(),
      },
    );
  }
}
