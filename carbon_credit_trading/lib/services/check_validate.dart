class Validators {
  // validate email
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email không được để trống';
    }
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(email)) {
      return 'Email không đúng cú pháp';
    }
    return null; // Không có lỗi
  }

  static String? validatePassword(String? password) {
    if (password == null || password.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    } else if (password.length < 8) {
      return 'Mật khẩu phải có ít nhất 8 ký tự';
    } else if (!RegExp(r'(?=.*[0-9])').hasMatch(password)) {
      return 'Mật khẩu phải chứa ít nhất một số';
    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Mật khẩu phải chứa ít nhất một chữ thường';
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Mật khẩu phải chứa ít nhất một chữ hoa';
    } else if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])').hasMatch(password)) {
      return 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt';
    }
    return null;
  }

// can check by importing library
  static String? validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return 'Số điện thoại không được để trống';
    }
    return null;
  }
}
