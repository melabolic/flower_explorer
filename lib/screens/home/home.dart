// Adding the necessary imports
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_explorer/assets/color_schemes.dart';
import 'package:flower_explorer/assets/type_family.dart';
import 'package:flower_explorer/services/firestore_db.dart';
import 'package:flutter/material.dart';
import '../flower_profile.dart';

// Builds the immutable Home widget
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 50.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Let's learn more about flowers! Choose an option below:",
            style: headerStyle,
          ),
          // sizedboxes are used to add more whitespace into the design
          const SizedBox(height: 40.0),
          // creating the buttons that will allow me to query the backend database
          RaisedButton(
            child: Text(
              "Filter by occasion",
              style: buttonStyle,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 18.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            onPressed: () {
              /* when the user clicks on the "filter by occasion" button, it takes them
              to the categories page */
              Navigator.of(context).pushNamed("Categories");
            },
          ),
          const SizedBox(height: 20.0),
          // Button for users to select a random flower
          RaisedButton(
            child: Text(
              "Get a random flower",
              style: buttonStyle,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 18.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
            ),
            onPressed: () {
              /* This entire function is responsible for obtaining an entry 
              for a random flower */
              Random _rng = Random();
              collection.getDocuments().then(
                (QuerySnapshot snapshot) {
                  int _len = snapshot.documents.length;
                  int _index = _rng.nextInt(_len);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        snapshot.documents[_index],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
