import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_explorer/screens/favorites/favorites.dart';
import 'package:flower_explorer/screens/flower_display/flower_categories.dart';
import 'package:flower_explorer/screens/flower_profile.dart';
import 'package:flower_explorer/services/firestore_db.dart';
import "package:flutter/material.dart";

// building the home screen
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Building the homescreen
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flower Explorer"),
        ),
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: generateRoute,
        ),
        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepOrange,
      onTap: _onItemTapped,
    );
  }

  _onItemTapped(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Favorites");
        break;
    }
    setState(() {
      _selectedIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Favorites":
        return MaterialPageRoute(builder: (context) => Favorites());
      case "Categories":
        return MaterialPageRoute(builder: (context) => Categories());
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}

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
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          // sizedboxes are used to add more whitespace into the design
          const SizedBox(height: 40.0),
          // creating the buttons that will allow me to query the backend database
          RaisedButton(
            child: Text("Filter by occasion"),
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("Categories");
            },
          ),
          const SizedBox(height: 20.0),
          RaisedButton(
            child: Text("Get a random flower"),
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 18.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
            ),
            onPressed: () {
              int _len;
              Random _rng = Random();
              collection.getDocuments().then(
                (QuerySnapshot snapshot) {
                  _len = snapshot.documents.length;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        snapshot.documents[_rng.nextInt(_len)],
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
