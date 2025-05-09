import 'package:flutter/material.dart';
import 'package:foodrecipt/core/textStyle/textStyle.dart';
import 'package:foodrecipt/core/themes/color.dart';
import 'package:foodrecipt/pages/dashBord.dart';
import 'package:foodrecipt/pages/form/login_form.dart';
import 'package:foodrecipt/pages/form/registration_form.dart';
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
        
 Column(
  children: [
    Row(
      
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBord()));
                },
                child: Container( margin: EdgeInsets.symmetric(horizontal: 10), child: Text("Later",style: TextStyle(color:Colors.white,fontSize:16),)),
              )
            ],
          ),
          Expanded(child: SizedBox()),
          Text("Welcome to Ethiopan\n Traditional Foods",style:fonts.White18,),
          SizedBox(height: 5,),
 Container( width: double.infinity, margin: EdgeInsets.symmetric(horizontal:30 ), child:Button(text: "Login", onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
 },color: const Color.fromARGB(255, 7, 134, 192),textColor: Colors.white,) ,) ,
  SizedBox(height: 10,),
  Center(
    child: GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationForm()));
      },
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