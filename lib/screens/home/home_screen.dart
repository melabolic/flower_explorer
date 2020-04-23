// Importing the necessary packages & files
import 'package:flower_explorer/screens/favorites/favorites.dart';
import 'package:flower_explorer/screens/flower_display/flower_categories.dart';
import "package:flutter/material.dart";
import 'home.dart';

/* 
  Initializing a stateful widget to help us navigate to the different screens. This 
  Widget (HomeScreen) is largely responsible for the routing and general layout - 
  Application Bar (on top) + Bottom Navigation Bar of my app.
*/

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This navigator state will be used to navigate to different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Flower Explorer"),
        ),
        // placing the Navigator widget here is what enables me to route to the 
        // many different pages in the app
        body: Navigator(
          key: _navigatorKey,
          onGenerateRoute: generateRoute,
        ),
        bottomNavigationBar: _buildNavigationBar(),
      ),
    );
  }

  // builds the persistent bottom navigation bar for the app
  Widget _buildNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem( // Home button
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem( // Favorites button
          icon: Icon(Icons.favorite),
          title: Text('Favorites'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepOrange,
      onTap: _onItemTapped, 
    );
  }

  // this function is what helps my app keep track of where the user is, and navigate to 
  // the respective home and favorites pages when clicked on 
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

  // stores (some of) the different routes for my app. The rest had to be
  // calibrated manually.
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

