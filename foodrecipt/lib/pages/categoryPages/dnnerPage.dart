import 'package:flutter/material.dart';
import 'package:foodrecipt/AppDatas/appfulldata.dart';
import 'package:foodrecipt/widgets/custom_card.dart';
import 'package:foodrecipt/widgets/food_card.dart';

class DinnerItems extends StatefulWidget {
  const DinnerItems({super.key});

  @override
  State<DinnerItems> createState() => _DinnerItemsState();
}

class _DinnerItemsState extends State<DinnerItems> {
  List<Map<String, dynamic>> datas = data.dinner.cast<Map<String, dynamic>>();
  int itemsToShow = 5; // Default number of items to show

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          Expanded(
            child:
                datas.isNotEmpty
                    ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var item in datas.take(
                            itemsToShow,
                          )) // Show limited items
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            FoodListScreen(selectedItem: item),
                                  ),
                                );
                              },
                              child: Container(
                                width: 300,
                                height: 250,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: FoodCard(
                                  data: item,
                                  toggleFavorite: () {},
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          ),
          // Show both "See More" and "See Less" buttons inline if there are more than 5 items
          if (datas.length > 5)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // "See More" button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      // Show all items
                      itemsToShow = datas.length;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    child: Text(
                      'See More', // Show 'See More' button
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // "See Less" button
                if (itemsToShow >
                    5) // Only show "See Less" if more than 5 items are shown
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Collapse to 5 items
                        itemsToShow = 5;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 5,
                      ),
                      child: Text(
                        'See Less', // Show 'See Less' button
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
