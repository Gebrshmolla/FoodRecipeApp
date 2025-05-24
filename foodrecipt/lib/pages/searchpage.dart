import 'package:flutter/material.dart';
import 'package:foodrecipt/AppDatas/appfulldata.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/widgets/button.dart';
import 'package:foodrecipt/widgets/custom_card.dart' show FoodCard;
import 'package:foodrecipt/widgets/food_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredData = data.datas;
  String _selectedCategory = 'All'; // All, Breakfast, Lunch, Dinner

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterFoods);
  }

  void _filterFoods() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      List<Map<String, dynamic>> sourceData;
      switch (_selectedCategory) {
        case 'Breakfast':
          sourceData = data.breakfast;
          break;
        case 'Lunch':
          sourceData = data.lunch;
          break;
        case 'Dinner':
          sourceData = data.dinner;
          break;
        default:
          sourceData = data.datas;
      }
      _filteredData =
          sourceData.where((item) {
            final name = item['name']?.toLowerCase() ?? '';
            return name.contains(query);
          }).toList();
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _searchController.clear(); // Reset search when category changes
      _filterFoods();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Foods'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for foods...',
                hintStyle: TextStyle(fontSize: 16, color: darkColor),
                prefixIcon: Icon(Icons.search, color: darkColor),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                        : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Button(
                    text: 'All',
                    onPressed: () => _selectCategory('All'),
                    color:
                        _selectedCategory == 'All' ? primaryColor : whiteColor,
                    borderRadius: 25,
                    textColor:
                        _selectedCategory == 'All'
                            ? Colors.white
                            : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Button(
                    text: 'Breakfast',
                    onPressed: () => _selectCategory('Breakfast'),
                    color:
                        _selectedCategory == 'Breakfast'
                            ? primaryColor
                            : whiteColor,
                    borderRadius: 25,
                    textColor:
                        _selectedCategory == 'Breakfast'
                            ? Colors.white
                            : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Button(
                    text: 'Lunch',
                    onPressed: () => _selectCategory('Lunch'),
                    color:
                        _selectedCategory == 'Lunch'
                            ? primaryColor
                            : whiteColor,
                    borderRadius: 25,
                    textColor:
                        _selectedCategory == 'Lunch'
                            ? Colors.white
                            : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Button(
                    text: 'Dinner',
                    onPressed: () => _selectCategory('Dinner'),
                    color:
                        _selectedCategory == 'Dinner'
                            ? primaryColor
                            : whiteColor,
                    borderRadius: 25,
                    textColor:
                        _selectedCategory == 'Dinner'
                            ? Colors.white
                            : Colors.black,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  _filteredData.isNotEmpty
                      ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var item in _filteredData)
                              Container(
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
                          ],
                        ),
                      )
                      : const Center(
                        child: Text(
                          'No foods found',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
