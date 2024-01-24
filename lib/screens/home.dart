import 'package:firstapp/screens/widgets/big_card.dart';
import 'package:firstapp/utils/states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    IconData icon;
    if (appState.favourite.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("A random idea: "),
            BigCard(pair: pair),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  label: Text('add favourite'),
                  onPressed: () => {
                    appState.toggleFavourtie(pair),
                  },
                  icon: Icon(icon),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => {
                    appState.getNext(),
                  },
                  child: Text('next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
