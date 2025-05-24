import 'package:flutter/material.dart';

class Discriptioncard extends StatelessWidget {
  final String statement;
  final String? pageInfo;

  const Discriptioncard({super.key, required this.statement, this.pageInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  statement,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
            if (pageInfo != null) ...[
              const SizedBox(height: 8),
              Text(
                pageInfo!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
