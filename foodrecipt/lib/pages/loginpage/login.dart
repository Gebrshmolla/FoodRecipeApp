import 'package:flutter/material.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/widgets/button.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
        Container(
            height: double.infinity,  // Ensures full height
            width: double.infinity,   // Ensures full width
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/l.webp"),
                fit: BoxFit.cover,  // Ensures the image covers the entire space
              ),
            ),
          ),
        
 Column(children: [
    Row(
      
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container( margin: EdgeInsets.symmetric(horizontal: 10), child: Text("Later",style: TextStyle(color:Colors.white,fontSize:16),)),
              )
            ],
          ),
          Expanded(child: SizedBox()),
  Button(text: "Login", onPressed: (){},color: const Color.fromARGB(255, 7, 134, 192),),
  SizedBox(height: 10,),
  Center(
    child: GestureDetector(
      child: Text("Creat New Account",style:TextStyle(
        color: whiteColor
      ),),
    ),
  ),
   SizedBox(height: 65,)
  ]
  ),
        ] 
      )
      
    );
  }
}