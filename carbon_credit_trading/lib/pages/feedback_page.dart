import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/feedback_item.dart';
import 'package:flutter/material.dart';

// list company reviews (userImage, companyName, rating, date, currentAcc dislike or likelike)

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of feedbacks
    final List<Comment> feedbackList = [
      Comment(
        userName: 'Renewable Biomass Energy Ventures',
        date: '13/06/2019',
        review:
            'Dự án này không chỉ giúp giảm phát thải khí nhà kính mà còn đóng góp tích cực cho việc phát triển bền vững vùng ven biển.',
        images: ['img1.jpg', 'img2.jpg', 'img3.jpg'],
        rating: 3,
        likes: ['You', 'user1'],
        dislikes: ['user2'],
        userImage: 'assets/user1.png',
      ),
      Comment(
        userName: 'Coastal Mangrove Restoration Initiative',
        date: '14/08/2019',
        review:
            'Chúng tôi cảm thấy dự án này góp phần tái sinh rừng nguyên sinh và giúp cải thiện đời sống của người dân địa phương.',
        images: ['img4.jpg', 'img5.jpg', 'img6.jpg'],
        rating: 4,
        likes: ['user3'],
        dislikes: ['You'],
        userImage: 'assets/user2.png',
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Đánh giá",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                '${feedbackList.length} đánh giá',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = feedbackList[index];

                  return FeedbackItem(feedback: feedback);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
