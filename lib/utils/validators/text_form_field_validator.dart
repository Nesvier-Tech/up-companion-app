class TextFormFieldValidator {
  const TextFormFieldValidator();

  String? call(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field cannot be empty.';
    }

    return null;
  }
}
