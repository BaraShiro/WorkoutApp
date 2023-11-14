import 'package:intl/intl.dart';

String durationString(Duration duration) {
  String hours = duration.inHours.toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

final DateFormat longFormatFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');