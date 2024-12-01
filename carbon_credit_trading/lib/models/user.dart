class User {
  final String email;
  final String type; // 'doanh_nghiep' or 'cty_trung_gian'

  User({required this.email, required this.type});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      type: json['type'],
    );
  }
}
