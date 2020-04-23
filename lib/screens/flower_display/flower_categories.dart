// Adding the necessary imports
import 'package:flower_explorer/assets/color_schemes.dart';
import 'package:flower_explorer/assets/type_family.dart';
import 'package:flower_explorer/screens/flower_display/categories_display.dart';
import 'package:flutter/material.dart';

/* 
  This page basically creates the UI for the user to be able to navigate to the 
  various flowers that belong under each separate occasion. It is a stateless widget
  because there is no need for it to update itself dynamically.
*/

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initializing the back button to return to the former screen it came from.
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return null;
      },
      child: Scaffold(
        // creating a new appbar here to allow users to navigate to their previous page
        appBar: AppBar(
          elevation: 0,
          backgroundColor: fourthColor,
          title: Text("Occasions", style: barStyle),
          centerTitle: true,
        ),
        body: ListView(
          // this widget creates a list view of all our occasions
          padding: EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 20.0,
          ),
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("Weddings", style: buttonStyle,),
              onPressed: () {
                /* when the user clicks on this button, it redirects them to the page with 
                all the items for this occasion */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlowerCarousel("weddings"),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            RaisedButton(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("Anniversaries", style: buttonStyle,),
              onPressed: () {
                /* when the user clicks on this button, it redirects them to the page with 
                all the items for this occasion */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlowerCarousel("anniversaries"),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            RaisedButton(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("Valentine's Day", style: buttonStyle,),
              onPressed: () {
                /* when the user clicks on this button, it redirects them to the page with 
                all the items for this occasion */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlowerCarousel("valentine's day"),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            RaisedButton(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text("Thanksgiving", style: buttonStyle,),
              onPressed: () {
                /* when the user clicks on this button, it redirects them to the page with 
                all the items for this occasion */
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlowerCarousel("thanksgiving"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
