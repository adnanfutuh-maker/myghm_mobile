class MyValidatior {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    if (value.length < 8) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  static String? validatePhoneNUmber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone is required.';
    }
    final emailRegExp = RegExp(r'^\d{12}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid phone number format (12digits required).';
    }
    return null;
  }
}
