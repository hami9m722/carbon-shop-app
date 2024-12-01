import '../models/user.dart';

class UserService {
  final List<User> _fakeUsers = [
    User(
        email: 'example@domain.com',
        password: 'Huda1493@',
        type: 'doanh_nghiep'),
    User(
        email: '21522425@gm.uit.edu.vn',
        password: 'Huda1493@',
        type: 'cty_trung_gian'),
  ];

  Future<User?> checkUser(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    for (var user in _fakeUsers) {
      if (user.email == email && user.password == password) {
        return user; // Trả về người dùng nếu tìm thấy
      }
    }

    return null; // Không tìm thấy người dùng
  }
}
