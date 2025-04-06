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
      appBar: AppBar(
        
      ),
      body: Column(
        children: [
         Container(
          height: 60,
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Column(
               children: [
                 Text(" Good morning "),
                 Text("Gebremeskel ")
               ],
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
           ],
           
         ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container( margin: EdgeInsets.only(left: 30), child: Text("Feautered",style: fonts.black18,)),
                    ],
                  ),
            SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                width: 300,
                height: 250,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
               width: 300,
                height: 250,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
               width: 300,
                height: 250,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              )), Container(
               width: 300,
                height: 250,
              child:FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"
              ))
              ]
              ),
          ),
          SizedBox(height: 20,),
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
              SizedBox(height: 20,),
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
         SizedBox(height: 20,),
         //catagorized sCreen
         Row(
                children: [
                  Container( margin: EdgeInsets.only(left: 30), child: Text("Popular Reciptions",style: fonts.black18,)),
                  Expanded(child: SizedBox()),
                    GestureDetector(
                    onTap: (){
                      print("seeall");
                    },
                    child: Container(margin: EdgeInsets.symmetric(horizontal:10), child: Text("See All",style: fonts.primary12,)))
                ]),
                 SizedBox(height: 20,),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 15,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 250,
                        child:Column(
                          children: [
                      FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"),
                       Text("The mornig foods")
                          ],
                        ) ,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: whiteColor,
                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_rounded)))),

                    ],
                  ),
                Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 250,
                        child:Column(
                          children: [
                      FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"),
                       Text("The mornig foods The mornig foods The mornig foods \nThe mornig foodsThe mornig foods")
                          ],
                        ) ,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: whiteColor,
                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_rounded)))),

                    ],
                  ), Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 250,
                        child:Column(
                          children: [
                      FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"),
                       Text("The mornig foods")
                          ],
                        ) ,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: whiteColor,
                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_rounded)))),

                    ],
                  ), Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 250,
                        child:Column(
                          children: [
                      FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"),
                       Text("The mornig foods")
                          ],
                        ) ,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: whiteColor,
                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_rounded)))),

                    ],
                  ),  Stack(
                    children: [
                      Container(
                        height: double.maxFinite,
                        width: 250,
                        child:Column(
                          children: [
                      FoodCard(foodImageUrl: "assets/image/loginlogo.jpg", chefImageUrl: "assets/image/loginlogo.jpg", chefName: "chefName", description: "description"),
                       Text("The mornig foods")
                          ],
                        ) ,
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: whiteColor,
                          child: IconButton(onPressed: (){}, icon:Icon(Icons.favorite_border_rounded)))),

                    ],
                  ),
                ]
                ),
            ),
          ),
        ],
      ),
    );
  }
}
