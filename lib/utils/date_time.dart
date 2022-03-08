import 'package:intl/intl.dart';
class TimeFormat{
  String displayDate(timestamp){
    var format = DateFormat('dd MMM, y');
    return format.format(timestamp.toDate());
  }
  String displayTime(timestamp){
      var format = DateFormat('jm');
       return format.format(timestamp.toDate());
  }
}