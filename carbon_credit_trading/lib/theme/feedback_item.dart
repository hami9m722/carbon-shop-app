import 'package:carbon_credit_trading/models/comment.dart';
import 'package:flutter/material.dart';

class FeedbackItem extends StatelessWidget {
  final Comment feedback;

  const FeedbackItem({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 4.0,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  left: 25, right: 10, top: 25, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          feedback.userName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        feedback.date,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (starIndex) {
                      return Icon(
                        starIndex < feedback.rating
                            ? Icons.star
                            : Icons.star_border,
                        color: starIndex < feedback.rating
                            ? Colors.yellow
                            : Colors.grey,
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  Text(feedback.review),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: feedback.images.length,
                      itemBuilder: (context, imgIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 150,
                            color: Colors.grey[300],
                            child: Center(
                              child: Text(feedback.images[imgIndex]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.thumb_up),
                        color: feedback.likes.contains('You')
                            ? Colors.blue
                            : Colors.grey,
                        onPressed: () {},
                        constraints: const BoxConstraints(
                          minWidth: 24,
                          minHeight: 24,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.thumb_down),
                        color: feedback.dislikes.contains('You')
                            ? Colors.red
                            : Colors.grey,
                        onPressed: () {},
                        constraints: const BoxConstraints(
                          minWidth: 24,
                          minHeight: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: CircleAvatar(
                radius: 25, // Adjust the radius as needed
                backgroundImage: AssetImage(feedback.userImage),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15), // Space between items
      ],
    );
  }
}
