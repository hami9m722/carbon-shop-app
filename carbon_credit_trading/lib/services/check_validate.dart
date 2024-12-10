class Validators {
  // Check null value
  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName không được để trống';
    }
    return null;
  }

  // Check email
  static String? validateEmail(String? email) {
    final String? requiredCheck = validateRequiredField(email, 'Email');
    if (requiredCheck != null) return requiredCheck;

    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(email!)) {
      return 'Email không đúng cú pháp';
    }
    return null;
  }

  // Check password
  static String? validatePassword(String? password) {
    final String? requiredCheck = validateRequiredField(password, 'Mật khẩu');
    if (requiredCheck != null) return requiredCheck;

    if (password!.length < 8) {
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

  // Check phone number
  static String? validatePhone(String? phone) {
    final String? requiredCheck = validateRequiredField(phone, 'Số điện thoại');
    if (requiredCheck != null) return requiredCheck;

    final RegExp phoneRegExp = RegExp(r'^\+?[1-9][0-9]{7,14}$');
    if (!phoneRegExp.hasMatch(phone!)) {
      return 'Số điện thoại không theo chuẩn quốc tế';
    }

    return null;
  }

  // Check tax id
  static String? validateTaxId(String? taxId) {
    final String? requiredCheck = validateRequiredField(taxId, 'Mã số thuế');

    if (requiredCheck != null) return requiredCheck;

    // Check if the TIN consists of 10 to 13 digits
    final RegExp regex = RegExp(r'^\d{10,13}$');
    if (!regex.hasMatch(taxId!)) {
      return 'Mã số thuế phải là 10-13 chữ số';
    }
    return null;
  }
}
