import 'package:intl/intl.dart';

extension StringToFormattedDate on String {
  String toFormattedDate() {
    DateTime date = DateTime.parse(this);
    return DateFormat('yyyy MMMM d', 'en_US').format(date);
  }



  DateTime toDateTime() => DateTime.parse(this);

}
extension DateTimeExtension on DateTime {
  String toFormattedString() {
    final formatter = DateFormat('dd-MMM-yy');
    return formatter.format(this);
  }
}