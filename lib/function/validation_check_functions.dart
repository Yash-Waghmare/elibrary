class CheckValidation {
  bool checkEmail({required String val}) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val);

    return emailValid;
  }

  bool checkNumber({required String val}) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (val.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(val)) {
      return false;
    }
    return true;
  }
}
