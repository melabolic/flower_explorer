// Adding the necessary imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flower_explorer/services/firestore_db.dart';

/* 
  This class here builds the individual flower profiles when a user accesses it through
  the favorites, random flower, or filtering by occasion options. It is a stateful widget
  because we need to be able to update widgets based on changes made to the database. 
*/

class Profile extends StatefulWidget {
  // takes in a document snapshot from whichever option it arrived from
  final DocumentSnapshot document;
  Profile(this.document);

  @override
  // passes the document snapshot to the state of the widget
  _ProfileState createState() => _ProfileState(this.document);
}

class _ProfileState extends State<Profile> {
  _ProfileState(this.document);
  DocumentSnapshot document;

  // building the screen
  @override
  Widget build(BuildContext context) {
    // initializing the document reference for easier access to the database
    DocumentReference documentReference =
        collection.document(document.documentID);

    return Scaffold(
      appBar: AppBar(
        title: Text(document['name']),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        // the MediaQuery widgets help to obtain the respective sizes of the devices
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
                  // print(snap.data['name']); for testing purposes
                  // print(snap.data['favorite']);

                  // building the automatically configured (un)favorites button
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
                    // the onPressed button simply updates the favorites value in the database
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
            // this creates an image of size 300x300 pixels
            Image.network(
              document['image_url'],
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20.0),
            // Prints out the flower description
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Description:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
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
