import 'package:flutter/material.dart';
import 'package:flutter_test_project/utils/app_navigation.dart';
import 'package:flutter_test_project/utils/app_routes_name.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';

class Constants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> logout(
      {bool fromLogout = false, required BuildContext c}) async {
    // if (fromLogout == true) {
    //   await AuthController.i.userLogout(context: c);
    // }
    // Get.context?.read<MeetingController>().leaveRoom();
    // Utils().disposeSocket();
    AppNavigation.navigateTo(Constants.navigatorKey.currentContext!,
        AppRouteName.LOGIN_SCREEN_ROUTE);
    // saveRememberInfo();
    // Get.delete<HomeController>();
  }

  // static parseDate({
  //   required String d,
  // }) {
  //   return DateFormat('MMM dd yyyy')
  //       .format(((DateTime.parse(d))).toUtc().toLocal());
  // }

  // static String relativeTime(String date) {
  //   DateTime d = DateTime.parse(date);
  //   return Jiffy.parse(d.toLocal().toString()).fromNow();
  // }

  // static String formatDuration(Duration duration) {
  //   String twoDigits(int n) {
  //     if (n >= 10) return "$n";
  //     return "0$n";
  //   }

  //   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  //   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  //   return "$twoDigitMinutes:$twoDigitSeconds";
  // }

  // //Date Formats
  // static const String MM_DD_YYYY_FORMAT = 'MM/dd/yyyy';

  // static String extracOftDate(String input) {
  //   RegExp regex = RegExp(r'\d{2}-\d{2}-\d{4}');
  //   Iterable<Match> matches = regex.allMatches(input);
  //   String? date;
  //   for (Match match in matches) {
  //     date = match.group(0);
  //   }
  //   return date ?? "";
  // }

  // static String formatExamsDate(DateTime date) {
  //   return DateFormat('dd-MM-yyyy').format(date);
  // }

  // static String convertDateTimeToLocal(String dateString, String timeString) {
  //   // Combine date and time strings
  //   String combinedDateTimeString = '$dateString $timeString';

  //   // Parse combined string into a DateTime object in UTC
  //   DateTime utcDateTime =
  //       // DateFormat('yyyy-MM-dd HH:mm').parse(combinedDateTimeString);
  //       DateFormat('dd-MM-yyyy HH:mm').parse(combinedDateTimeString);

  //   // Get the local timezone offset
  //   Duration offset = DateTime.now().timeZoneOffset;

  //   // Convert UTC DateTime to local timezone (UTC+5:30)
  //   DateTime localDateTime = utcDateTime.add(offset);

  //   // Format local DateTime to desired format
  //   String formattedDate = DateFormat('d MMM - hh:mm a').format(localDateTime);

  //   return formattedDate;
  // }

  // static void unFocusKeyboardMethod({required BuildContext context}) {
  //   FocusScope.of(context).unfocus();
  // }

  // //
  // static String convertDasteTimeToLocal(String dateString) {
  //   // Combine date and time strings
  //   String combinedDateTimeString = dateString;
  //   // $timeString';

  //   // Parse combined string into a DateTime object in UTC
  //   DateTime utcDateTime =
  //       // DateFormat('yyyy-MM-dd HH:mm').parse(combinedDateTimeString);
  //       DateFormat('dd-MM-yyyy HH:mm').parse(combinedDateTimeString);

  //   // Get the local timezone offset
  //   Duration offset = DateTime.now().timeZoneOffset;

  //   // Convert UTC DateTime to local timezone (UTC+5:30)
  //   DateTime localDateTime = utcDateTime.add(offset);

  //   // Format local DateTime to desired format
  //   String formattedDate = DateFormat('d MMM - hh:mm a').format(localDateTime);

  //   return formattedDate;
  // }

  // static String convertUtcToLocalTest(String utcTimeString) {
  //   DateTime utcDateTime = DateTime.parse(utcTimeString).toLocal();
  //   String formattedDate = DateFormat('dd MMM - hh:mm a').format(utcDateTime);
  //   return formattedDate;
  // }

  // static String formatDateTime2(String dateString, String timeString) {
  //   // Combine date and time strings
  //   String combinedDateTimeString = '$dateString $timeString';
  //   // Parse combined string into a DateTime object
  //   DateTime dateTime =
  //       DateFormat('dd-MM-yyyy hh:mm a').parse(combinedDateTimeString);
  //   // Format DateTime to desired format
  //   String formattedDate = DateFormat('d MMM - hh:mm a').format(dateTime);
  //   return formattedDate;
  // }

  // static String convertUtc24To12HourFormat(String time24) {
  //   DateFormat format24 = DateFormat('HH:mm');
  //   DateFormat format12 = DateFormat('hh:mm a');

  //   // Parse the UTC time string
  //   DateTime timeUtc = format24.parse(time24).toUtc();

  //   // Get the local timezone offset
  //   Duration offset = DateTime.now().timeZoneOffset;

  //   // Convert UTC time to local time
  //   DateTime localTime = timeUtc.add(offset);

  //   // Format the local time in 12-hour format
  //   String time12 = format12.format(localTime);

  //   return time12;
  // }

  // static String formatDate(String inputDate) {
  //   // Parse the input date string
  //   DateTime dateTime = DateFormat('yyyy-MM-dd').parse(inputDate);

  //   // Format the date as "d-M-yyyy"
  //   String formattedDate = DateFormat('dd-M-yyyy').format(dateTime);

  //   return formattedDate;
  // }

  // ///-------------------- Format Date -------------------- ///
  // static String formatDate2({String? pattern, DateTime? date}) {
  //   DateFormat _dateFormat = DateFormat(pattern);
  //   return _dateFormat.format(date ?? DateTime.now());
  // }

  // static GlobalKey<NavigatorState> drawerKey = GlobalKey<NavigatorState>();
  // //! ============> Network Image Controll Fully
  // // AuthSingletonUserRole authSingletonUserRole = AuthSingletonUserRole();

  // static String getFormattedTime(String? date, {bool isutc = false}) {
  //   return DateFormat(_timeFormat).format(
  //     _parseDateTime24(date ?? DateTime.now().toString(), isutc: isutc),
  //   );
  // }

  // static const String _monthYearFormat = "MM/yy";

  // static String getFormattedMonthYear({required String date, String? format}) {
  //   return DateFormat(format ?? _monthYearFormat).format(DateTime.parse(date));
  // }

  // static const String _timeFormat = "hh:mm aa";
  // static const String _dateTimeFormat24 = "yyyy-MM-dd HH:mm:ss";
  // static const String _dateTimeFormat12 = "yyyy-MM-ddTHH:mm:ss";

  // static DateTime _parseDateTime12(String date, {bool isutc = false}) {
  //   DateTime dateTime = DateFormat(_dateTimeFormat12).parse(
  //     date,
  //     isutc,
  //   );
  //   return isutc ? dateTime.toLocal() : dateTime;
  // }

  // static String getFormattedTime12(String? date, {bool isutc = false}) {
  //   return DateFormat(_timeFormat).format(
  //     _parseDateTime12(date ?? DateTime.now().toString(), isutc: isutc),
  //   );
  // }

  // static DateTime _parseDateTime24(String date, {bool isutc = false}) {
  //   DateTime dateTime = DateFormat(_dateTimeFormat24).parse(
  //     date,
  //     isutc,
  //   );
  //   return isutc ? dateTime.toLocal() : dateTime;
  // }

  // //! ============> Date Convert String to String (From This: 1997-11-05 00:00:00:000 to This: May 13, 2023)
  // static String formatDateString(String dateString) {
  //   // Parse the date string
  //   DateTime dateTime = DateTime.parse(dateString);

  //   // Format the date in the desired format
  //   String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);

  //   return formattedDate;
  // }

  // static String convertUtcTo24HourFormat(String utcTimeString) {
  //   DateTime utcTime =
  //       DateFormat('MM-dd-yyyy HH:mm:ss').parseUtc(utcTimeString);
  //   DateTime localTime = utcTime.toLocal();
  //   return DateFormat('HH:mm:ss').format(localTime);
  // }

  // //! New Method For Converting both Date and Time in to UTC Time zone
  // static Map<String, String> convertDateTimeToUTC(String mergedDateTimeString) {
  //   // Parse the mergedDateTimeString into a DateTime object
  //   DateTime mergedDateTime =
  //       DateFormat('yyyy-MM-dd hh:mm a').parse(mergedDateTimeString);

  //   // Convert the DateTime to UTC
  //   DateTime utcDateTime = mergedDateTime.toUtc();

  //   // Format the UTC DateTime as a string
  //   String formattedUTCDate = DateFormat('MM-dd-yyyy').format(utcDateTime);
  //   String formattedUTCTime = DateFormat('HH:mm').format(utcDateTime);

  //   return {
  //     'mergedDate': mergedDateTimeString,
  //     'convertedDateToUTCTimeZone': formattedUTCDate,
  //     'convertedTimeToUTCTimeZone': formattedUTCTime,
  //   };
  // }

  // //! ============> Yeh Wale Dono methods convertUtcToLocal & convertUtcToTime list k liye hen, dono me String format me
  // //! ============> Date And Time jata hai then wo merge ho k 1st me Date return karta hai 11-24-2023 is formate me
  // //! ============> or second wala method Time return karta hai Local time zone me 02:14 AM is format me
  // //! ============>  Return Date in to Local Time Zone
  // static String convertUtcToLocal(String utcTimeString) {
  //   DateTime utcTime =
  //       DateFormat('MM-dd-yyyy HH:mm:ss').parseUtc(utcTimeString);

  //   DateTime localTime = utcTime.toLocal();
  //   return DateFormat('MM-dd-yyyy').format(localTime);
  // }

  // //! ============>  Return Time in to Local Time Zone
  // static String convertUtcToTime(String utcTimeString) {
  //   DateTime utcTime =
  //       DateFormat('MM-dd-yyyy HH:mm:ss').parseUtc(utcTimeString);
  //   DateTime localTime = utcTime.toLocal();
  //   return DateFormat('hh:mm a').format(localTime);
  // }

  // //! ============> Formate the date like this 11-23-2023
  // static String formatDateFromString(String dateString) {
  //   DateTime date = DateTime.parse(dateString);
  //   return DateFormat('MM-dd-yyyy').format(date);
  // }

  // static String convertToUtc(String localDateTimeString) {
  //   // Parse the String into a DateTime object
  //   DateTime localDateTime =
  //       DateFormat('yyyy-MM-dd hh:mm a').parse(localDateTimeString);

  //   // Convert the DateTime to UTC
  //   DateTime utcDateTime = localDateTime.toUtc();

  //   // Format the UTC DateTime as a string (optional)
  //   String formattedUtcDateTime = DateFormat('MM-dd-yyyy').format(utcDateTime);

  //   return formattedUtcDateTime;
  // }

  // static String extractDate(String dateTimeString) {
  //   // Parse the String into a DateTime object
  //   DateTime dateTime = DateTime.parse(dateTimeString);

  //   // Extract only the date part
  //   String datePart = DateFormat('yyyy-MM-dd').format(dateTime);

  //   return datePart;
  // }

  // static DateTime extractDate2(String dateTimeString) {
  //   // Parse the String into a DateTime object
  //   // Parse the String into a DateTime object
  //   DateTime dateTime = DateFormat('MM/dd/yyyy').parse(dateTimeString);

  //   return dateTime;
  // }

  // static String convertToUtcTimeString(String dateTimeString) {
  //   // Parse the input string to DateTime
  //   DateTime dateTime = DateFormat("yyyy-MM-dd h:mm a").parse(dateTimeString);

  //   // Format the DateTime to a 24-hour format
  //   String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);

  //   // Convert to UTC
  //   DateTime utcDateTime = dateTime.toUtc();
  //   String formattedUTCDateTime = DateFormat("HH:mm").format(utcDateTime);

  //   return formattedUTCDateTime;
  // }

  // //! ============> Network Image Controll Fully For Profile View Page 4 on bottom bar (Venue & Guest)
  // static ImageProvider<Object> getImageProvider({
  //   required String imagePath,
  //   bool updatingProfile = true,
  // }) {
  //   return updatingProfile
  //       ? NetworkImage(imagePath) as ImageProvider
  //       : FileImage(File(imagePath));
  // }

  // static Widget fadeNetworkImage({
  //   required String imagePath,
  //   bool updatingProfile = false,
  // }) {
  //   return FadeInImage(
  //     placeholder: const AssetImage("AssetPaths.USER_IMAGE"),
  //     image: getImageProvider(
  //       imagePath: imagePath,
  //       updatingProfile: updatingProfile,
  //     ),
  //     fit: BoxFit.cover,
  //     imageErrorBuilder: (context, error, stackTrace) {
  //       // You can customize the error message or return a different widget here
  //       return Container(
  //         color: Colors.grey, // Placeholder color in case of an error
  //         child: const Center(
  //           child: Icon(
  //             Icons.error,
  //             color: Colors.red,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // //! ============> Date converter from  2000-12-31 to this May 13, 2023
  // static String convertDOBFormater(String inputDOB) {
  //   try {
  //     DateTime dobDate = DateFormat("yyyy-MM-dd").parse(inputDOB);
  //     return DateFormat("MMMM dd, yyyy").format(dobDate);
  //   } catch (e) {
  //     // Handle any parsing or formatting errors here
  //     print("Error: $e");
  //     return "Invalid DOB";
  //   }
  // }

  // //! ============> Date converter from November 7, 1960 to this 11/14/1991
  // static String convertDateFormat(String inputDate) {
  //   // Define the input and output date formats
  //   final inputFormat = DateFormat('MMMM d, y');
  //   final outputFormat = DateFormat('MM/dd/yyyy');

  //   // Parse the input date
  //   final DateTime date = inputFormat.parse(inputDate);

  //   // Format the date in the desired output format
  //   final String formattedDate = outputFormat.format(date);

  //   return formattedDate;
  // }

  // //! ============> Conveft UTC to local timezone
  // static String convertToAMPMFormat(String timeString) {
  //   try {
  //     // Get the current date in UTC
  //     DateTime currentDateUtc = DateTime.now().toUtc();

  //     // Concatenate the current date with the provided time string
  //     String utcDateTimeString =
  //         "${DateFormat('yyyy-MM-dd').format(currentDateUtc)} $timeString";
  //     // Parse the combined UTC date-time string
  //     DateTime utcDateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
  //         .parse(utcDateTimeString, true)
  //         .toUtc();

  //     // Convert to local time zone
  //     DateTime localDateTime = utcDateTime.toLocal();

  //     // Format the time in 12-hour format with AM/PM
  //     String formattedTime = DateFormat("h:mm a").format(localDateTime);

  //     return formattedTime;
  //   } catch (e) {
  //     print("Error converting time: $e");
  //     return ""; // or some default value
  //   }
  // }

  // //! ============> Date Merger
  // static Map<String, String> mergeAndSplitDateTime({
  //   required String dateStr,
  //   required String time,
  // }) {
  //   List<String> dateParts = dateStr.split('/');
  //   int month = int.parse(dateParts[0]);
  //   int day = int.parse(dateParts[1]);
  //   int year = int.parse(dateParts[2]);

  //   String timeStr = time.trim();
  //   DateFormat format = DateFormat('h:mm a'); // Adjusted Time format
  //   DateTime parsedTime;

  //   try {
  //     parsedTime = format.parse(timeStr).toUtc(); // Convert to UTC
  //   } catch (e) {
  //     // Handle parsing error
  //     print('Error parsing time: $e');
  //     return {'date': '', 'time': ''}; // Return empty strings on error
  //   }

  //   DateTime mergedDateTime =
  //       DateTime.utc(year, month, day, parsedTime.hour, parsedTime.minute);

  //   // Splitting into date and time strings
  //   String dateResult = DateFormat('MM/dd/yyyy').format(mergedDateTime);
  //   String timeResult = DateFormat('HH:mm').format(mergedDateTime);

  //   return {'date': dateResult, 'time': timeResult};
  // }

  // //! ============> convert this 11/15/2023 into this 11-15-2023
  // static String dateConvert(String originalDateString) {
  //   List<String> dateComponents = originalDateString.split('/');
  //   if (dateComponents.length != 3) {
  //     throw const FormatException('Invalid date format');
  //   }

  //   int? month = int.tryParse(dateComponents[0]);
  //   int? day = int.tryParse(dateComponents[1]);
  //   int? year = int.tryParse(dateComponents[2]);

  //   if (month == null || day == null || year == null) {
  //     throw const FormatException('Invalid date format');
  //   }

  //   DateTime originalDate = DateTime(year, month, day);

  //   String formattedDate = DateFormat('MM-dd-yyyy').format(originalDate);

  //   return formattedDate;
  // }

  // //! ============> 24 hours time formater
  // static String convertTo24HourFormat(String twelveHourTime) {
  //   try {
  //     // Parse the input time using DateFormat
  //     DateFormat inputFormat = DateFormat('h:mm a');
  //     DateTime dateTime = inputFormat.parse(twelveHourTime);

  //     // Format the time to 24-hour format
  //     DateFormat outputFormat = DateFormat('HH:mm');
  //     String twentyFourHourTime = outputFormat.format(dateTime);

  //     return twentyFourHourTime;
  //   } catch (e) {
  //     return 'Invalid Time Format';
  //   }
  // }

  // //! ============> Date converter from  11/14/1991 to this 14-11-1991
  // static String convertDOBFormatered(String inputDOB) {
  //   try {
  //     DateTime dobDate = DateFormat("MM/dd/yyyy").parse(inputDOB);
  //     return DateFormat("dd-MM-yyyy").format(dobDate);
  //   } catch (e) {
  //     // Handle any parsing or formatting errors here
  //     print("Error: $e");
  //     return "Invalid DOB";
  //   }
  // }

  // //! ============> Date converter from  11/14/1991 to this 2000-12-31
  // static String convertDOBForCompleteProfile(String inputDOB) {
  //   try {
  //     DateTime dobDate = DateFormat("MM/dd/yyyy").parse(inputDOB);
  //     return DateFormat("yyyy-MM-dd").format(dobDate);
  //   } catch (e) {
  //     // Handle any parsing or formatting errors here
  //     print("Error: $e");
  //     return "Invalid DOB";
  //   }
  // }

  // //! ============> Checking 18 or 18+ Date for DateTime Validation
  // static bool isAdult(String birthDateString) {
  //   String datePattern = "dd-MM-yyyy";

  //   DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
  //   DateTime today = DateTime.now();

  //   int yearDiff = today.year - birthDate.year;
  //   int monthDiff = today.month - birthDate.month;
  //   int dayDiff = today.day - birthDate.day;

  //   return yearDiff >= 18 ||
  //       yearDiff == 18 && monthDiff > 0 ||
  //       yearDiff == 18 && monthDiff == 0 && dayDiff >= 0;
  // }

  // //! ============> Standard Lengths
  // static const EMAIL_MAX_LENGTH = 35;
  // static const PASSWORD_MAX_LENGTH = 30;
  // static const NAME_MAX_LENGTH = 30;
  // static const ZIP_CODE_MAX_LENGTH = 7;
  // static const DESCRIPTION_MAX_LENGTH = 275;
  // static const NO_OF_FOLLOWERS_LENGTH = 9;
  // static const NO_OF_GUESTS_LENGTH = 6;

  // //! ============> App Font Family
  // static const String APP_FONT_FAMILY = "Poppins-Regular";

  // static MaterialColor PRIMARY_SWATCH_COLOR =
  //     const MaterialColor(0XFF54BAB9, <int, Color>{
  //   50: Color(0XFF54BAB9),
  //   100: Color(0XFF54BAB9),
  //   200: Color(0XFF54BAB9),
  //   300: Color(0XFF54BAB9),
  //   400: Color(0XFF54BAB9),
  //   500: Color(0XFF54BAB9),
  //   600: Color(0XFF54BAB9),
  //   700: Color(0XFF54BAB9),
  //   800: Color(0XFF54BAB9),
  //   900: Color(0XFF54BAB9),
  // });

  // //! ============> Date formater
  // static String formatDateTime(
  //     {required String parseFormat, required DateTime inputDateTime}) {
  //   return DateFormat(parseFormat).format(inputDateTime);
  // }

  // //! ============> Time formater
  // String formatTime({required DateTime inputDateTime}) {
  //   return DateFormat.jm()
  //       .format(inputDateTime); // "jm" format represents "h:mm a"
  // }

  // static String mergeDateAndTimeStrings({
  //   required String dateStr,
  //   required String timeStr,
  //   bool returnDateTimeString = false,
  // }) {
  //   // Detecting date string format
  //   String dateFormat = dateStr.contains('-') ? 'MM-dd-yyyy' : 'MM/dd/yyyy';

  //   // Parsing date string into DateTime based on detected format
  //   DateTime date = DateFormat(dateFormat).parse(dateStr);

  //   // Parsing time string into TimeOfDay
  //   DateFormat timeFormat = DateFormat('hh:mm a');
  //   DateTime parsedTime = timeFormat.parse(timeStr);
  //   TimeOfDay time = TimeOfDay.fromDateTime(parsedTime);

  //   // Combining date and time
  //   DateTime combinedDateTime =
  //       DateTime(date.year, date.month, date.day, time.hour, time.minute);

  //   if (returnDateTimeString) {
  //     // Returning DateTime as a string in UTC 24-hour format
  //     return combinedDateTime.toUtc().toIso8601String().substring(0, 19);
  //   } else {
  //     // Returning formatted date and time in UTC 24-hour format
  //     String formattedDateTime =
  //         DateFormat('$dateFormat HH:mm').format(combinedDateTime.toUtc());
  //     return formattedDateTime;
  //   }
  // }

  // static String convertToUTC(String dateTimeString) {
  //   DateTime dateTime = DateTime.parse(dateTimeString);
  //   DateTime utcDateTime = dateTime.toUtc();
  //   String formattedUTC = utcDateTime.toIso8601String();
  //   return formattedUTC;
  // }

  // static Map<String, String> getFormattedDateAndTime(String dateTimeString) {
  //   DateTime dateTime = DateTime.parse(dateTimeString).toLocal();

  //   String formattedDate = DateFormat('MM-dd-yyyy').format(dateTime);
  //   String formattedTime = DateFormat.Hm().format(dateTime);

  //   return {'date': formattedDate, 'time': formattedTime};
  // }

  // static String formatTimeToString(DateTime dateTime) {
  //   // Define your desired time format
  //   final String timeFormat = 'hh:mm a'; // Example: 'hh:mm a' for AM/PM format

  //   // Use the intl package to format the DateTime object
  //   final formattedTime = DateFormat(timeFormat).format(dateTime);

  //   return formattedTime;
  // }
}
