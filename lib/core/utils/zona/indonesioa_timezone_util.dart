class IndonesianTimezoneUtil {
  static String getTimezone() {
    final int offset = DateTime.now().timeZoneOffset.inHours;

    if (offset == 7) {
      return 'WIB';
    } else if (offset == 8) {
      return 'WITA';
    } else if (offset == 9) {
      return 'WIT';
    } else {
      return 'WIB';
    }
  }
}
