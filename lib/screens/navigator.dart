import 'package:firstapp/screens/favorite.dart';
import 'package:firstapp/screens/home.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavigatorState();
}

class _NavigatorState extends State<Nav> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget screen;
    switch (selectedIndex) {
      case 0:
        screen = HomeScreen();
        break;
      case 1:
        screen = FavoriteScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorite'),
                )
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) => {
                setState(
                  () {
                    selectedIndex = value;
                  },
                )
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: screen,
            ),
          )
        ],
      ),
    );
  }
}
