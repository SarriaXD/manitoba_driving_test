class UserInputValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is required';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFirstName(String firstName) {
    if (firstName.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  static String? validateLastName(String lastName) {
    if (lastName.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }
}
