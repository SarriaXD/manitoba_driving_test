class TimeFormatter {
  // This method takes an integer time in seconds and returns a string in the format "mm:ss"
  static String formatTime(int second) {
    final int minutes = second ~/ 60;
    final int seconds = second % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // This method takes an integer time in seconds and returns a string in the format "mm min ss s"
  // If the time is more than 1 hour, it will return "hh hours"
  static String formatTimeWithWords(int second) {
    final int hours = second ~/ 3600;
    final int minutes = second ~/ 60;
    final int seconds = second % 60;
    if (hours > 0) {
      return '$hours hour${hours > 1 ? 's' : ''}';
    }
    final minutesStr = minutes > 0 ? '$minutes min ' : '';
    final secondsStr = '${seconds}s';
    return '$minutesStr$secondsStr';
  }

  // if the date is today, return time like 3:00 AM or 3:00 PM
  // if yesterday, return 'Yesterday'
  // if in this week, return date like Mon
  // if this year, return date like Feb 12
  // else last year or 2 years ago
  static String formatToTimeOrDaysFromNow(DateTime date) {
    final yearMonthDay = DateTime(date.year, date.month, date.day);
    final now = DateTime.now();
    if (yearMonthDay == DateTime(now.year, now.month, now.day)) {
      return '${date.hour}:${date.minute.toString().padLeft(2, '0')} ${date.hour < 12 ? 'AM' : 'PM'}';
    }
    // if yesterday
    if (yearMonthDay == DateTime(now.year, now.month, now.day - 1)) {
      return 'Yesterday';
    }
    // if the date is in this week, return like 3 days ago
    if (date.isAfter(now.subtract(const Duration(days: 8)))) {
      return '${now.difference(date).inDays} days ago';
    }
    // if the date is in this year, return like Feb 12
    if (date.year == now.year) {
      final month = switch (date.month) {
        1 => 'Jan',
        2 => 'Feb',
        3 => 'Mar',
        4 => 'Apr',
        5 => 'May',
        6 => 'Jun',
        7 => 'Jul',
        8 => 'Aug',
        9 => 'Sep',
        10 => 'Oct',
        11 => 'Nov',
        _ => 'Dec',
      };
      return '$month ${date.day}';
    }
    // else return like 1 year ago or 2 years ago
    return '${now.year - date.year} year${now.year - date.year > 1 ? 's' : ''} ago';
  }
}
