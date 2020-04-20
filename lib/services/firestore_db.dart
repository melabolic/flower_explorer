import 'package:cloud_firestore/cloud_firestore.dart';

final _db = Firestore.instance;
final collection = _db.collection("flowers");