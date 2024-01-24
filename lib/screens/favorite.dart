import 'package:firstapp/screens/widgets/big_card.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/utils/states.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final item = appState.favourite[index];
          return SizedBox(
            width: 100,
            child: Card(
              color: theme.colorScheme.primary,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.asCamelCase}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        appState.deleteFavoriteItem(item);
                      },
                      child: Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: appState.favourite.length,
      ),
    );
  }
}
