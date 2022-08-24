class Email {
  static checkEmailFormat(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (value.isNotEmpty && emailValid == false) {
      return "x Please enter the correct format of email";
    } else if (value.isEmpty) {
      return 'x Please enter the email';
    }
    return null;
  }
}
