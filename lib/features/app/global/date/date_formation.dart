import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final today = DateTime.now();
  final yesterday = today.subtract(Duration(days: 1));
  final tomorrow = today.add(Duration(days: 1));
  final timeFormatter = DateFormat('h:mm a');

  if (dateTime.year == today.year &&
      dateTime.month == today.month &&
      dateTime.day == today.day) {
    return 'Today at ${timeFormatter.format(dateTime)}';
  } else if (dateTime.year == tomorrow.year &&
      dateTime.month == tomorrow.month &&
      dateTime.day == tomorrow.day) {
    return 'Tomorrow at ${timeFormatter.format(dateTime)}';
  } else if (dateTime.year == yesterday.year &&
      dateTime.month == yesterday.month &&
      dateTime.day == yesterday.day) {
    return 'Yesterdat at ${timeFormatter.format(dateTime)}';
  } else {
    final dateFormatter = DateFormat('MMM d');
    return '${dateFormatter.format(dateTime)}, ${dateFormatter.format}';
  }
}
