import 'package:flutter/material.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/widgets/custom_card.dart';
import 'food_card.dart'; // your FoodCard widget file

class FoodListScreen extends StatelessWidget {
  final Map<String, dynamic> selectedItem;
  FoodListScreen({super.key, required this.selectedItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 253, 254, 255),
      child: ListView.builder(
        itemCount: selectedItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = selectedItem[index];
          return Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 01,
                color: const Color.fromARGB(255, 221, 220, 220),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),

            child: Stack(
              children: [
                Container(
                  height: double.maxFinite,
                  width: 250,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      FoodCard(data: item, toggleFavorite: () {}),
                      const SizedBox(height: 5),
                      Container(
                        height: 30,
                        child: Text(
                          "${item['description']} ",
                          style: fonts.black18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
