import 'package:flutter/material.dart';
import 'package:foodrecipt/AppDatas/appfulldata.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/pages/AboutCoders.dart';
import 'package:foodrecipt/pages/categoryPages/breakfast.dart';
import 'package:foodrecipt/pages/categoryPages/dnnerPage.dart';
import 'package:foodrecipt/pages/categoryPages/lunchpage.dart';
import 'package:foodrecipt/pages/searchpage.dart';
import 'package:foodrecipt/widgets/bootomsheet.dart';
import 'package:foodrecipt/widgets/button.dart';
import 'package:foodrecipt/widgets/custom_card.dart';
import 'package:foodrecipt/widgets/food_card.dart';
import 'favorites_page.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  List<Map<String, dynamic>> Data = data.datas.cast<Map<String, dynamic>>();
  TextEditingController t1 = TextEditingController();
  List pages = [
    const BreakfastItems(),
    const LunchItems(),
    const DinnerItems(),
  ];
  int curentindex = 0;
  int _selectedIndex = 0;
  int itemsToShow = 5; // To control the number of items displayed initially

  Color _bgColor = Colors.white;
  double _textSize = 16;
  String _language = 'English';

  void currentPage(int index) {
    setState(() {
      curentindex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      setState(() {
        curentindex = 0;
      });
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const FavoritesPage()),
      );
    } else if (index == 2) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return SettingsBottomSheet(
            initialColor: _bgColor,
            initialTextSize: _textSize,
            initialLanguage: _language,
            onChanged: (color, size, lang) {
              setState(() {
                _bgColor = color;
                _textSize = size;
                _language = lang;
              });
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutAs()),
                );
              },
              child: const Icon(Icons.people),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 70),
                height: 40,
                child: TextField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText:
                        _language == 'English' ? 'Search Your Food' : 'ምግብ ፈልግ',
                    hintStyle: TextStyle(fontSize: _textSize, color: darkColor),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Container(child: null),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cultural Foods Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    _language == 'English'
                        ? "Ethiopian Cultural Foods"
                        : "የኢትዮጵያ ባህላዊ ምግቦች",
                    style: TextStyle(
                      fontSize: _textSize + 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Data.isNotEmpty
                    ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            Data.take(itemsToShow).map((item) {
                              return GestureDetector(
                                onDoubleTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => FoodListScreen(
                                            selectedItem: item,
                                          ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 200,
                                  height: 250,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: FoodCard(
                                    data: item,
                                    toggleFavorite: () {},
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
                const SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (itemsToShow < Data.length) {
                          itemsToShow = Data.length;
                        } else {
                          itemsToShow = 5;
                        }
                      });
                    },
                    child: Text(
                      itemsToShow < Data.length
                          ? (_language == 'English' ? 'Show More' : 'ተጨማሪ አሳይ')
                          : (_language == 'English' ? 'Show Less' : 'ቀንስ'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Category Section Title Only (Fixed)
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 30),
              child: Text(
                _language == 'English' ? "Category" : "ምድቦች",
                style: TextStyle(
                  fontSize: _textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Scrollable Category Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Button(
                    text: _language == 'English' ? "BreakFast" : "ቁርስ",
                    onPressed: () => currentPage(0),
                    color: curentindex == 0 ? primaryColor : whiteColor,
                    borderRadius: 25,
                    textColor: curentindex == 0 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Button(
                    text: _language == 'English' ? "Lunch" : "ትኩስ ምሳ",
                    onPressed: () => currentPage(1),
                    color: curentindex == 1 ? primaryColor : whiteColor,
                    borderRadius: 25,
                    textColor: curentindex == 1 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Button(
                    text: _language == 'English' ? "Dinner" : "እራት",
                    onPressed: () => currentPage(2),
                    color: curentindex == 2 ? primaryColor : whiteColor,
                    borderRadius: 25,
                    textColor: curentindex == 2 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Popular Recipes Section
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text(
                    _language == 'English'
                        ? "Popular Recipes"
                        : "ታዋቂ የምግብ አሰራሮች",
                    style: TextStyle(
                      fontSize: _textSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(height: 260, child: pages[curentindex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
