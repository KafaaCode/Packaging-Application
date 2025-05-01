import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const MainCard({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
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
        const SizedBox(height: 6),
        Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          name,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
