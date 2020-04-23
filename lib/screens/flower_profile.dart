import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flower_explorer/services/firestore_db.dart';

class Profile extends StatefulWidget {
  final DocumentSnapshot document;
  Profile(this.document);

  @override
  _ProfileState createState() => _ProfileState(this.document);
}

class _ProfileState extends State<Profile> {
  // FirestoreHelper firestoreHelper = FirestoreHelper();
  _ProfileState(this.document);
  DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    DocumentReference documentReference =
        collection.document(document.documentID);

    return Scaffold(
      appBar: AppBar(
        title: Text(document['name']),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              // creates a stream that listens to the main database and make updates
              // for the favorites button
              child: StreamBuilder(
                stream: documentReference.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (!snap.hasData) {
                    return null;
                  }
                  // print(snap.data['name']);
                  // print(snap.data['favorite']);
                  return FlatButton(
                    child: Container(
                      width: (document['favorite'] ? 120 : 110),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          (snap.data['favorite']
                              ? Text("Unfavorite")
                              : Text("Favorite")),
                          SizedBox(width: 12.0),
                          (snap.data['favorite']
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border)),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      bool _value = snap.data['favorite'] ? false : true;
                      print(snap.data['favorite']);
                      await documentReference.updateData({"favorite": _value});
                      print(snap.data['favorite']);
                    },
                  );
                },
              ),
            ),
            Image.network(
              document['image_url'],
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20.0),
            Text(
              document['descriptor'],
            ),
          ],
        ),
      ),
    );
  }
}

/* 
if (document['favorite']) {
                      await collection.document(document.documentID).updateData(
                        {"favorite": true},
                      );
                    } else {
                      await collection.document(document.documentID).updateData(
                        {"favorite": true},
                      );
                    }
                    setState(() {});
*/
