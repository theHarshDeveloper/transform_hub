extension CapExtension on String {
  String get inCaps => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String get toCamelCase => toLowerCase().split(" ").map((str) => str.inCaps).join(" ");

}
