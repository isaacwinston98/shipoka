import 'dart:ui';

extension StringExtension on String {
  Color toColor() {
    final hexColor = toString();

    return Color(int.parse('0xff$hexColor'));
  }

  String get capitalize =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstofEach =>
      split(' ').map((str) => str.capitalize).join(' ');
  String get svg => 'assets/images/svg/$this.svg';
  String get png => 'assets/images/png/$this.png';
}

extension IsPhoneNumber on String {
  bool isPhoneNumber() {
    try {
      final value = toString();
      if (value.startsWith('+')) return true;
      int.parse(value);
      return true;
    } on FormatException {
      return false;
    }
  }
}

extension IsValidAmount on String {
  bool isValidAmount() {
    try {
      final value = toString();
      if (value.isEmpty) return false;
      double.parse(value);
      return true;
    } on FormatException {
      return false;
    }
  }
}