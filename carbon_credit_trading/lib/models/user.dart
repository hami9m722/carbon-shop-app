import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/globals.dart';

class User {
  final String? businessName;
  final String? email;
  final String? password;
  final BusinessOption? type;
  final String? image;
  bool isInChat;

  User({
    this.businessName,
    this.email,
    this.password,
    this.type,
    this.image,
    this.isInChat = false,
  });
}
