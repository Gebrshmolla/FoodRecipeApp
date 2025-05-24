import 'package:flutter/material.dart';
import 'package:foodrecipt/logics/favoirets.dart';
import 'package:foodrecipt/pages/cooking_page.dart';

class FoodCard extends StatefulWidget {
  final Map<String, dynamic> data;
  final VoidCallback toggleFavorite;

  const FoodCard({super.key, required this.data, required this.toggleFavorite});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isFavorite = false;
  late Favoirets favor;

  @override
  void initState() {
    super.initState();
    _initFavoriteStatus();
  }

  Future<void> _initFavoriteStatus() async {
    favor = await Favoirets.create();
    final favoriteStatus = favor.isFavorite(widget.data['name']);

    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      favor.addToFavorites(widget.data);
    } else {
      favor.removeFavorite(widget.data['name']);
    }

    widget.toggleFavorite(); // in case parent needs update
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CookingPage(selectedItem: widget.data),
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.asset(
              widget.data['foodImage'] ?? 'assets/images/placeholder.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Center(child: Text('Image not found')),
                  ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              right: 16,
              top: 16,
              child: IconButton(
                onPressed: _toggleFavorite,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.data['description'] != null &&
                      widget.data['description'].isNotEmpty)
                    Text(
                      widget.data['description'],
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.702),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 2),
                  Text(
                    widget.data['name'] ?? 'Unnamed Food',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
