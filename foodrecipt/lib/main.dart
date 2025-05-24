import 'package:flutter/material.dart';
import 'package:foodrecipt/pages/dashBord.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  runApp(const MyApp()); // Run app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Initialize Hive box
  Future<void> _initializeHive() async {
    await Hive.openBox('favorites');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initializeHive(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const DashBord(); // Show dashboard after Hive is ready
          } else if (snapshot.hasError) {
            return const Scaffold(
              body: Center(child: Text('Error initializing Hive')),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
