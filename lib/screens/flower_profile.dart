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
  _ProfileState(this.document);
  DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
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
              child: RaisedButton(
                child: _favButton(),
                onPressed: () async {
                  print("It was ${document['favorite']}");
                  if (document['favorite']) {
                    await collection.document(document.documentID).updateData(
                      {"favorite": false},
                    );
                  } else {
                    await collection.document(document.documentID).updateData(
                      {"favorite": true},
                    );
                  }
                  setState(() {
                    // TODO: find a way to update the button each time it is tapped on
                  });
                },
              ),
            ),
            Image.network(
              widget.document['image_url'],
              height: 300,
              width: 300,
            ),
            SizedBox(height: 20.0),
            Text(
              widget.document['descriptor'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _favButton() {
    return Container(
      width: (document['favorite'] ? 182 : 140),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          (document['favorite']
              ? Text("Remove from Favorites")
              : Text("Add to Favorites")),
          SizedBox(width: 12.0),
          (document['favorite']
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}
