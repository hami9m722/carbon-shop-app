import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/feedback_item.dart';
import 'package:flutter/material.dart';

//list transaction reviews (userImage, companyName, rating, date, currentAcc dislike or likelike)

class TransactionFeedbackPage extends StatelessWidget {
  const TransactionFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of feedbacks
    final Comment transactionFeedback = Comment(
      userName: 'Renewable Biomass Energy Ventures',
      date: '13/06/2019',
      review:
          'Dự án này không chỉ giúp giảm phát thải khí nhà kính mà còn đóng góp tích cực cho việc phát triển bền vững vùng ven biển.',
      images: ['img1.jpg', 'img2.jpg', 'img3.jpg'],
      rating: 3,
      likes: ['You', 'user1'],
      dislikes: ['user2'],
      userImage: 'assets/user1.png',
    );

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Đánh giá",
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FeedbackItem(feedback: transactionFeedback)),
    );
  }
}
