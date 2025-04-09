import 'package:flutter/material.dart';
import 'package:foodrecipt/AppDatas/appfulldata.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/pages/categoryPages/breakfast.dart';
import 'package:foodrecipt/pages/categoryPages/dnnerPage.dart';
import 'package:foodrecipt/pages/categoryPages/lunchpage.dart';
import 'package:foodrecipt/widgets/button.dart';
import 'package:foodrecipt/widgets/custom_card.dart';
import 'package:foodrecipt/widgets/food_card.dart';

class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}
class _DashBordState extends State<DashBord> {
  List Data = data.Datas;
  TextEditingController t1 = TextEditingController();
  List pages=[BreakfastItems(),LunchItems(),DinnerItems()];
  int curentindex=0;
  void currentPage(int index){
    setState(() {
      curentindex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        Container( margin: EdgeInsets.only(left: 30), child: Text("Ethiopian Cultural Foods",style: fonts.black18,)),
                      ],
                    ),
              SizedBox(height: 10,),
       Data.isNotEmpty
  ? SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Data.map<Widget>((item) {
          return Container(
            width: 300,
            height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: FoodCard(
              foodImageUrl: item['foodImage'],
              chefImageUrl: item['foodImage'], // or item['chefImage'] if you have it
              chefName: item['chefName'],
              description: item['description'],
            ),
          );
        }).toList(),
      ),
    )
  : const Center(child: CircularProgressIndicator())
,
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
                      Button(text: "BreakFast  ", onPressed: (){
                        currentPage(0);
                      },color: curentindex==0? primaryColor:whiteColor,borderRadius: 25,textColor:curentindex==0?Colors.white:Colors.black,),
                      Button(text: "Lunch  ", onPressed: (){
                        currentPage(1);
                      },color: curentindex==1? primaryColor:whiteColor,borderRadius: 25,textColor:curentindex==1?Colors.white:Colors.black,),
                      Button(text: "Dinner  ", onPressed: (){
                        currentPage(2);
                      },color: curentindex==2? primaryColor:whiteColor,borderRadius: 25,textColor:curentindex==2?Colors.white:Colors.black,),
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
                   SizedBox(
                    height: 260,
                    child:pages[curentindex],
                   )
          ],
        ),
      ),
    );
  }
}
