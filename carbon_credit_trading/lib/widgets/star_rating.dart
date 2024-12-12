import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int starCount;
  final double rating;
  final ValueChanged<double> onRatingChanged;

  const StarRating({
    super.key,
    this.starCount = 5,
    this.rating = 0.0,
    required this.onRatingChanged,
  });

  @override
  createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    rating = widget.rating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              rating = index + 1.0;
              widget.onRatingChanged(rating);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              size: 30,
              color: Colors.amber,
            ),
          ),
        );
      }),
    );
  }
}
