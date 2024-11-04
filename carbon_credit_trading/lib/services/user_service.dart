import '../models/user.dart';

class UserService {
  final List<User> _fakeUsers = [
    User(
        email: 'example@domain.com',
        password: 'Huda123456@',
        type: 'doanh_nghiep'),
    User(
        email: '21522425@gm.uit.edu.vn',
        password: 'Huda123456@',
        type: 'cty_trung_gian'),
  ];

  Future<User?> checkUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    for (var user in _fakeUsers) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }

    return null; 
  }
}
