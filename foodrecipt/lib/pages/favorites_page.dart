import 'package:flutter/material.dart';
import 'package:foodrecipt/widgets/custom_card.dart' show FoodCard;
import 'package:hive/hive.dart';
import 'package:foodrecipt/widgets/food_card.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the 'favorites' box
    final box = Hive.box(
      'favoirets',
    ); // Make sure the name matches the box name used to store favorites

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),

      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, _) {
          // Map the box values into a list of Map objects
          final favorites =
              box.values
                  .map((e) => Map<String, dynamic>.from(e as Map))
                  .toList();

          // If no favorites are found
          if (favorites.isEmpty) {
            return const Center(child: Text('No favorites added yet!'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final item = favorites[index];
              return Container(
                width: 100,
                height: 100,

                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: FoodCard(
                  data: item,
                  toggleFavorite: () {
                    // Remove the favorite when toggled
                    if (item['name'] != null) {
                      (box as Box)?.delete(item['name']);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
