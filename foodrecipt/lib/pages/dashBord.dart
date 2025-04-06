import 'package:flutter/material.dart';
import 'package:foodrecipt/widgets/custom_card.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  TextEditingController t1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                width: 200,
                height: 150,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
                width: 200,
                height: 150,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
                width: 200,
                height: 150,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
                width: 200,
                height: 150,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              ))
              ]
              ),
          ),
          Center(child: Text("hellow")),
        ],
      ),
    );
  }
}
