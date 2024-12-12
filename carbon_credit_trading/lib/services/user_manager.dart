import 'package:carbon_credit_trading/models/user.dart';

class UserManager {
  static final UserManager _instance = UserManager._internal();

  factory UserManager() {
    return _instance;
  }

  UserManager._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  void login(String email, String password) {
    _currentUser = User(email: email, password: password);
  }

  void logout() {
    _currentUser = null;
  }
}
