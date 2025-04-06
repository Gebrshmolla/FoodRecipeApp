import'package:flutter/material.dart';
class DashBord extends StatefulWidget {
  const DashBord({super.key});

  @override
  State<DashBord> createState() => _DashBordState();
}

class _DashBordState extends State<DashBord> {
  TextEditingController t1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children: [
          Row(children: [Container(child:Text("data") ,)],),
          Center(child: Text("hellow"),),
        ],
      ),
    );
  }
}