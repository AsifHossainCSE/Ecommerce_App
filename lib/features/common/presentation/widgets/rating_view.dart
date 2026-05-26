import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Icon(Icons.star, size: 16, color: Colors.amber),
        Text('4.5'),
      ],
    );
  }
}