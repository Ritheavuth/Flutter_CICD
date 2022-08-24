class EmptyThings {
  static String? checkEmptyField(String? value) {
    if (value!.isEmpty) {
      return 'x This is require to field';
    }

    return null;
  }
}
