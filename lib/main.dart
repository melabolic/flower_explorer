/* This is the main file that executes our app */
import 'package:flower_explorer/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Explorer App',
      // setting the theme for our entire application
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          body: HomeScreen(title: "Flower Explorer")),
    );
  }
}