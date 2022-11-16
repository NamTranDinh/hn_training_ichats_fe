class Validators {
  /// trandinhnamnd0102@gmail.com
  static isEmailValid(String email) {
    final regularExpression = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regularExpression.hasMatch(email);
  }

  ///   r'^
  ///   (?=.*[A-Z])       // should contain at least one upper case
  ///   (?=.*[a-z])       // should contain at least one lower case
  ///   (?=.*?[0-9])      // should contain at least one digit
  ///   (?=.*?[!@#\$&*~]) // should contain at least one Special character
  ///   .{8,}             // Must be at least 8 characters in length
  ///   $
  /// Namtran123! : true
  static isPasswordValid(String password) {
    final regularExpression =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return regularExpression.hasMatch(password);
  }

  ///
  static isUserNameValid(String username) {
    final regularExpression =
        RegExp(r'^[A-Za-z][A-Za-z0-9_]{7,30}$');
    return regularExpression.hasMatch(username);
  }

  ///
  static isNumberValid(String value) {
    final regularExpression =
    RegExp(r'^[0-9]+$');
    return regularExpression.hasMatch(value);
  }
}
