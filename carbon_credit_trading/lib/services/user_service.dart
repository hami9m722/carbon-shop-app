import '../models/user.dart';

class UserService {
  // Danh sách người dùng giả lập
  final List<User> _fakeUsers = [
    User(email: 'example@domain.com', type: 'doanh_nghiep'),
    User(email: 'another@domain.com', type: 'cty_trung_gian'),
  ];

  Future<User?> checkUser(String email) async {
    // Giả lập một độ trễ để mô phỏng việc gọi API
    await Future.delayed(const Duration(seconds: 1));

    // Kiểm tra xem email có tồn tại trong danh sách không
    for (var user in _fakeUsers) {
      if (user.email == email) {
        return user; // Trả về người dùng nếu tìm thấy
      }
    }
    
    return null; // Không tìm thấy người dùng
  }
}
