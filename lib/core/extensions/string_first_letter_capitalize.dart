//Extension injected inside a string so that it is possible
//to leave only the first letter capitalized using only "string.capitalize()"
extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    }
    return this;
  }
}
