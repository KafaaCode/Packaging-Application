import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const MainCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 25,
                  height: 25,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          name,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
