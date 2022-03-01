// ignore_for_file: unnecessary_this

extension CapExtension on String{
  String get inCaps => this.isNotEmpty ? '${this[0].toUpperCase()}${this.substring(1)}':'';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstOfEach => this.replaceAll(
    RegExp(' +'), '').split(" ").map((str) => str.inCaps).join(" ");

}
