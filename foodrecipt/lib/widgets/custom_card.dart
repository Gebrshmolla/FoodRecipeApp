import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String foodImageUrl;
  final String chefImageUrl;
  final String chefName;
  final String description;

  const FoodCard({
    super.key,
    required this.foodImageUrl,
    required this.chefImageUrl,
    required this.chefName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background Food Image
          Image.asset(foodImageUrl, fit: BoxFit.cover),

          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          // Text and Chef Info
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.702),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Chef profile image
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage(chefImageUrl),
                    ),
                    const SizedBox(width: 8),

                    // Name and description
                    Expanded(
                      child: Text(
                        chefName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
