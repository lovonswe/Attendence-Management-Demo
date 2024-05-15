import 'package:flutter/material.dart';

class ImageDetailsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isShared;

  const ImageDetailsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.isShared = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Delete action
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                    IconButton(
                      onPressed: () {
                        // Share action
                      },
                      icon: const Icon(Icons.share),
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    if (isShared)
                      const Icon(
                        Icons.people,
                        color: Colors.green,
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
