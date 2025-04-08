import 'package:flutter/material.dart';

class DinnerItems extends StatefulWidget {
  const DinnerItems({super.key});

  @override
  State<DinnerItems> createState() => _DinnerItemsState();
}

class _DinnerItemsState extends State<DinnerItems> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Dinner"),);
  }
}