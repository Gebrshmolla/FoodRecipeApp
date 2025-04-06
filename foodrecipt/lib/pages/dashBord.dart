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
          Row(children: [Container(child:FoodCard(foodImageUrl: "assets/image/loginloo.jpg", chefImageUrl: "assets/image/loginloo.jpg", chefName: "chefName", description: "description"))]),
          Center(child: Text("hellow")),
        ],
      ),
    );
  }
}
