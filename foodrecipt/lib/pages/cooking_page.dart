import 'package:flutter/material.dart';
import 'package:foodrecipt/widgets/video_player.dart';

class CookingPage extends StatefulWidget {
  const CookingPage({super.key});

  @override
  State<CookingPage> createState() => _CookingPageState();
}

class _CookingPageState extends State<CookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome to ${4*3}"),
      ),
      body:Container(  height: 200,  width: 200, child: VideoApp()),
    );
  }
}