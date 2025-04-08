import 'package:flutter/material.dart';
import 'package:foodrecipt/widgets/food_card.dart';

class BreakfastItems extends StatefulWidget {
  const BreakfastItems({super.key});

  @override
  State<BreakfastItems> createState() => _BreakfastItemsState();
}

class _BreakfastItemsState extends State<BreakfastItems> {
    List Data = [
    {
      'foodImage': 'assets/image/loginlogo.jpg',
    
      'chefName': 'Chef A',
      'description': 'Delicious breakfast injera'
    },
     {
      'foodImage': 'assets/image/loginlogo.jpg',
      'chefImage': 'assets/image/loginlogo.jpg',
      'chefName': 'Chef A',
      'description': 'Delicious breakfast injera'
    },
     {
      'foodImage': 'assets/image/loginlogo.jpg',
      'chefImage': 'assets/image/loginlogo.jpg',
      'chefName': 'Chef A',
      'description': 'Delicious breakfast injera'
    },
     {
      'foodImage': 'assets/image/loginlogo.jpg',
      'chefImage': 'assets/image/loginlogo.jpg',
      'chefName': 'Chef A',
      'description': 'Delicious breakfast injera'
    },
     {
      'foodImage': 'assets/image/loginlogo.jpg',
      'chefImage': 'assets/image/loginlogo.jpg',
      'chefName': 'Chef A',
      'description': 'Delicious breakfast injera'
    },
    {
      'foodImage': 'assets/image/loginlogo.jpg',
      'chefImage': 'assets/image/loginlogo.jpg',
      'chefName': 'Chef B',
      'description': 'Spicy doro wat'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
          child:FoodListScreen(foodItems:Data,) 
    );
  }
}