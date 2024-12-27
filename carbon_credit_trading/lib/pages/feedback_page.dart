import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/models/comment.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/widgets/custom_appbar.dart';
import 'package:carbon_credit_trading/widgets/feedback_item.dart';
import 'package:flutter/material.dart';

// list company reviews (userImage, companyName, rating, date, currentAcc dislike or likelike)

// list company reviews (userImage, companyName, rating, date, currentAcc dislike or likelike)

class FeedbackPage extends StatelessWidget {
  final int projectId;

  const FeedbackPage({super.key, required this.projectId});

  Future<List<Comment>> getFilteredComments() async {
    try {
      final pagedReviewDTO =
          await userControllerApi.viewProjectReviews(projectId);

      if (pagedReviewDTO != null) {
        return await Future.wait(pagedReviewDTO.content.map((reviewData) {
          return reviewData.toComment();
        }));
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching projects: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Đánh giá",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Add padding for the entire body
        child: FutureBuilder<List<Comment>>(
          future: getFilteredComments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Có lỗi xảy ra: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Không có đánh giá nào.'));
            } else {
              final feedbackList = snapshot.data!;

              return ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = feedbackList[index];
                  return FeedbackItem(feedback: feedback);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
