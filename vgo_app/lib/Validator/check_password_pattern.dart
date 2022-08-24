class Password {
  static String? checkPasswordPattern(String value) {
    String pattern = r'^(?=.*\d).{8,16}$';

    RegExp regExp = RegExp(pattern);

    if (value.isNotEmpty && regExp.hasMatch(value) == false) {
      return "x Must be at least 8 character";
    } else if (value.isEmpty) {
      return 'x Please input password the correct Pattern';
    }
    return null;
  }

  static bool checkConfirmPasword(value, textPasswordController) {
    if (textPasswordController == value) {
      return true;
    } else {
      return false;
    }
  }
}
