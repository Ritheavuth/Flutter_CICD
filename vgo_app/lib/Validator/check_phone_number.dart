class PhoneService {
  static validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{8}$)';
    RegExp regExp = RegExp(patttern);

    if (value.isNotEmpty && !regExp.hasMatch(value)) {
      return 'x Please enter valid mobile number';
    }
    return null;
  }
}
