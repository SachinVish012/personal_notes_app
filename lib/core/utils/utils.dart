import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String generateUniqueId() {
  var uuid = const Uuid();
  String uniqueId = uuid.v4();
  return uniqueId;
}

String getFriendlyDate(String inputDate) {
  final input = DateTime.parse(inputDate);
  final now = DateTime.now();

  // Time part for comparison
  final inputDay = DateTime(input.year, input.month, input.day);
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));

  final differenceInMinutes = now.difference(input).inMinutes;

  // Logic for "just now"
  if (differenceInMinutes < 2) {
    return "Just now";
  }

  // Logic for "min ago"
  if (differenceInMinutes < 60) {
    return "$differenceInMinutes min ago";
  }

  // Logic for "X hours ago" for today's date
  if (inputDay == today) {
    final differenceInHours = now.difference(input).inHours;
    return "$differenceInHours hour${differenceInHours == 1 ? '' : 's'} ago";
  }

  // Logic for "Yesterday"
  if (inputDay == yesterday) {
    return "Yesterday";
  }

  return DateFormat('MMM dd, yyyy').format(input);
}
