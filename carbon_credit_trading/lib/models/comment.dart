class Comment {
  final String userName;
  final String userImage;
  final String date;
  final String review;
  final List<String> images;
  final int rating;
  final List<String> likes;
  final List<String> dislikes;

  Comment({
    required this.userName,
    required this.userImage,
    required this.date,
    required this.review,
    required this.images,
    required this.rating,
    this.likes = const [],
    this.dislikes = const [],
  });
}
