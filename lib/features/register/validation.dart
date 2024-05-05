extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@gmail+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\>\<*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }
  bool get isValidID {
    final  egyptianNationalIDRegex = RegExp(r'^([1-9]{1})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})[0-9]{3}([0-9]{1})[0-9]{1}$');

    return egyptianNationalIDRegex.hasMatch(this);
  }
}
