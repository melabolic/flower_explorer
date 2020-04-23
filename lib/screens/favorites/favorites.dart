// Adding the necessary imports
import 'package:flower_explorer/screens/flower_profile.dart';
import 'package:flower_explorer/services/firestore_db.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*
  This class creates our favorites page (as accessible from the bottom navigation bar).
  It is a stateful widget because we need this page to be able make immediate UI
  updates should a user choose to unfavorite a flower.
*/

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        // queries the database for any entries with a "true" marked in its favorites
        // column
        stream: collection.where("favorite", isEqualTo: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(), // loading animation
            );
          } else {
            if (snapshot.data.documents.length == 0) {
              // if there are no favorite flowers, let the user know by stating it
              // on the screen
              return Center(
                child: Text(
                  "Nothing in favorites!",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              );
            } else { 
              // otherwise, print out the names of the flowers, along with a delete 
              // button that will remove the entry
              return ListView(
                padding: EdgeInsets.all(18.0),
                children: snapshot.data.documents.map(
                  (DocumentSnapshot document) {
                    return GestureDetector(
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(18.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(
                                    4.0,
                                    4.0,
                                  ),
                                ),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(document['name']),
                              GestureDetector(
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                  // function to remove the entry from favorites
                                  onTap: () async {
                                    await collection
                                        .document(document.documentID)
                                        .updateData(
                                      {"favorite": false},
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        // when a card is tapped, it goes to its full profile
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(document),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              );
            }
          }
        },
      ),
    );
  }
}

