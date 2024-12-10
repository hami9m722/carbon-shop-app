class User {
  final String? businessName;
  final String? email;
  final String? password;
  final String? type;
  bool isInChat;

  User(
      {this.businessName,
      this.email,
      this.password,
      this.type,
      this.isInChat = false});
}
