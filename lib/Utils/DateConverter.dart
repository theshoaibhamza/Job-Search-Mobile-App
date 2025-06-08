import 'package:intl/intl.dart';

String getPostedAgo(String dateString) {
  try {
    DateTime postedDate = DateFormat(
      "EEE, dd MMM yyyy HH:mm:ss 'GMT'",
    ).parseUtc(dateString);
    DateTime now = DateTime.now().toUtc();
    Duration diff = now.difference(postedDate);

    if (diff.inDays >= 30) {
      int months = (diff.inDays / 30).floor();
      return "$months month${months == 1 ? '' : 's'} ago";
    } else if (diff.inDays >= 1) {
      return "${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago";
    } else if (diff.inHours >= 1) {
      return "${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago";
    } else {
      return "Just now";
    }
  } catch (e) {
    return "Unknown";
  }
}
