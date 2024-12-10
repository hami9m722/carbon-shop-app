class User {
  final String? businessName;
  final String? email;
  final String? password;
  final String? type;
  final String? image;
  bool isInChat;

  User(
      {this.businessName,
      this.email,
      this.password,
      this.type,
      this.image,
      this.isInChat = false});
}
