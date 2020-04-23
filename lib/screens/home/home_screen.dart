// Importing the necessary packages & files
import 'package:flower_explorer/screens/favorites/favorites.dart';
import 'package:flower_explorer/screens/flower_display/flower_categories.dart';
import "package:flutter/material.dart";

import 'home.dart';

// Building the home screen
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

