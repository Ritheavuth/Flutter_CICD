class NamingConvetion {
  static String? nameValidation(String value) {
    String patter = r'^[a-zA-Z0-9]+$';
    RegExp regExp = RegExp(patter);
    value.trim();
    if (value.length > 1) {
      if (double.tryParse(value.substring(0, 1)) != null) {
        return "x start with a character";
      }
      if (!regExp.hasMatch(value)) {
        return "x special character exist";
      } else {
        return null;
      }
    } else {
      return 'x maximum 2 characters';
    }
  }
}
