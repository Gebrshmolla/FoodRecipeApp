import 'package:flutter/material.dart';

class LunchItems extends StatefulWidget {
  const LunchItems({super.key});

  @override
  State<LunchItems> createState() => _LunchItemsState();
}

class _LunchItemsState extends State<LunchItems> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Lunch"),);
  }
}