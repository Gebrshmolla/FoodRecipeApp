import 'package:flutter/material.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/widgets/button.dart';
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
          SizedBox(height: 10,),
          //Catagors
          Column(
            children: [
              Row(
                children: [
                  Container( margin: EdgeInsets.only(left: 30), child: Text("Category",style: fonts.black18,)),
                  Expanded(child: SizedBox()),

                   GestureDetector(
                    onTap: (){
                      print("seeall");
                    },
                    child: Container(margin: EdgeInsets.symmetric(horizontal:10), child: Text("See All",style: fonts.primary12,))),
                ],
              ),
              SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 40,
                  children: [
                    Button(text: "BreakFast  ", onPressed: (){},color: primaryColor,borderRadius: 25,textColor: Colors.white,),
                    Button(text: "Lunch  ", onPressed: (){},color: whiteColor,borderRadius: 25,),
                    Button(text: "Dinner  ", onPressed: (){},color: whiteColor,borderRadius: 25,),
                  ],
                ),
              )

            ],
          ),
          Center(child: Text("hellow")),
        ],
      ),
    );
  }
}
