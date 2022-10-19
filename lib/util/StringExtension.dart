extension CapExtension on String {
  String get inCaps => this.isEmpty ? this : '${this[0].toUpperCase()}${this.substring(1)}';

  String get toCamelCase => this.toLowerCase().split(" ").map((str) => str.inCaps).join(" ");

}
