import 'package:intl/intl.dart';

extension Formatter on String {
  String formatTimeAPI() {
    final inputDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(this);
    return DateFormat('yyyy-MM-dd').format(inputDateTime);
  }

  String formatTime() {
    final inputDateTime = DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(this);
    return DateFormat('dd MMMM yyyy').format(inputDateTime);
  }

  String formatTimeDisplay() {
    final inputDateTime = DateFormat('yyyy-MM-dd HH:mm').parse(this);
    return DateFormat('dd-MM-yyyy').format(inputDateTime);
  }

  String formatTimeDisplayMonth() {
    final inputDateTime = DateFormat('yyyy-MM-dd HH:mm').parse(this);
    return DateFormat('dd MMMM yyyy').format(inputDateTime);
  }

  String formatTimeApiFormatRequest() {
    final inputDateTime = DateFormat('yyyy-MM-dd HH:mm').parse(this);
    return DateFormat('yyyy-MM-dd').format(inputDateTime);
  }
}
