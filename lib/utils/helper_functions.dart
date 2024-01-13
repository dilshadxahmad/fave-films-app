import 'package:intl/intl.dart';

class HelperFunctions {
  static String showYearsFromDate(String unformattedDate) {
    final dateTime = DateTime.parse(unformattedDate);
    return DateFormat('yyyy').format(dateTime);
  }
}
