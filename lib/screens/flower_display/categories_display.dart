// Adding the necessary imports
import 'package:flower_explorer/assets/color_schemes.dart';
import 'package:flower_explorer/assets/type_family.dart';
import 'package:flower_explorer/screens/flower_profile.dart';
import 'package:flutter/material.dart';
import 'package:flower_explorer/services/firestore_db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:strings/strings.dart';

/* 
  This file creates the widgets that displays the flowers from the category in a 
  horizontal scroll orientation.
*/

class FlowerCarousel extends StatefulWidget {
  final String occasion;
  FlowerCarousel(this.occasion);

  @override
  // passes on the name of the occasion to the state
  _FlowerCarouselState createState() => _FlowerCarouselState(this.occasion);
}

class _FlowerCarouselState extends State<FlowerCarousel> {
  String occasion;
  _FlowerCarouselState(this.occasion);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          capitalize(occasion), // capitalizes the first letter of this string
          style: barStyle,
        ),
        centerTitle: true,
        backgroundColor: fourthColor,
      ),
      // This builder takes in a stream and outputs the flowers from this category in
      // a nicely formatted card arranged in a horizontally scrollable carousel
      body: StreamBuilder<QuerySnapshot>(
        stream:
            collection.where("occasion", arrayContains: occasion).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              // creates a vertically scrollable widget
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 40.0,
              ),
              children: snapshot.data.documents.map(
                (DocumentSnapshot document) {
                  // creating the card for the individual flowers
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        height: MediaQuery.of(context).size.height - 120.0,
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey.shade200,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20.0,
                              spreadRadius: 5.0,
                              offset: Offset(
                                10.0,
                                10.0,
                              ),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Align(
                              // prints the image
                              alignment: Alignment.center,
                              child: Image.network(
                                document['image_url'],
                                width: 300,
                                height: 300,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              // prints the name of the flower
                              document['name'],
                              style: titleStyle,
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              // prints a shortened version of the descriptor
                              document['descriptor'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: paraStyle,
                            ),
                            const SizedBox(height: 60.0),
                            Text(
                              "Read more",
                              style: readMoreStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      // directs the user to the specific flower profile when clicked on
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
        },
      ),
    );
  }
}
