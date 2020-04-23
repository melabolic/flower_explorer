import 'package:cloud_firestore/cloud_firestore.dart';

/* 
  The 'final' keyword indicates that the variable will only be set once 
  throughout this entire app, making this implementation very similar to 
  the singleton design pattern - where the goal is to obtain a single instance
  of the object.
*/
final _db = Firestore.instance;
final collection = _db.collection("flowers");
