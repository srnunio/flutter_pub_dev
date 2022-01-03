import 'package:intl/intl.dart';
import 'package:flutter_package/src/l18n.dart';

extension TimedEx on Timed {
  String get time => _customTime();

  String _customTime() {
    var data = this.data();
    var timeType = data[Timed.KEY_TYPE_TIME] as String;
    var value = data[Timed.KEY_VALUE] as int;

    if (timeType == Timed.NOW) return timeType.translate;

    if (timeType == Timed.DATE_TIME) {
      var date = DateTime.fromMillisecondsSinceEpoch(value);
      return DateFormat('dd-MM-yyyy').format(date);
    }

    return 'time_type'
        .translate
        .replaceAll('*', timeType.translate.toLowerCase())
        .replaceAll('#', '$value');
  }
}

class Timed {
  static const KEY_VALUE = 'value-time';
  static const KEY_TYPE_TIME = 'type-time';
  static const DATE_TIME = 'date';
  static const NOW = 'now';

  final DateTime _time;

  DateTime get _now => DateTime.now();

  factory Timed.initialize({required DateTime date}) => Timed._(
        date,
      );

  Timed._(this._time);

  /// [_getData] create value
  Map<String, dynamic> _getData(String spacetime, int value) =>
      {KEY_TYPE_TIME: spacetime, KEY_VALUE: value};

  /// [data] returns the time interval to a date in seconds, minutes,days, weeks, months, or years
  /// Note: if the interval is longer than 2 years it will return to that of the informed
  Map<String, dynamic> data() {
    var difference = _now.difference(_time);
    /*----------------- Check inSeconds ------------------*/
    if (difference.inSeconds == 0) return _getData(NOW, difference.inSeconds);
    var minutes = _parseSecondsToMinutes(difference.inSeconds);
    if (minutes == 0)
      return _getData(difference.inSeconds > 1 ? 'seconds' : 'second',
          difference.inSeconds);

    if (minutes > 0 && minutes <= 59)
      return _getData(minutes > 1 ? 'minutes' : 'minute', minutes);
    /*----------------- Check minutes ------------------*/
    var hours = _parseMinutesToHours(minutes);
    if (hours >= 1 && hours < 24)
      return _getData(hours > 1 ? 'hours' : 'hour', hours);
    if (hours == 24) return _getData('hour', 1);
    /*----------------- Check days ------------------*/
    var days = _parseHoursToDays(hours);
    if (days >= 1 && days < 7) return _getData(days > 1 ? 'days' : 'day', days);
    /*----------------- Check week ------------------*/
    var week = _parseDaysToWeek(days);
    if (week >= 1 && week < 4)
      return _getData(week > 1 ? 'weeks' : 'week', week);
    if (week == 4) return _getData('month', 1);
    /*----------------- Check month ------------------*/
    var month = _parseWeekToMonth(week);
    if (month >= 1 && month < 12)
      return _getData((month > 1) ? 'months' : 'month', month);
    if (month == 12) return _getData('year', 1);
    /*----------------- Check year ------------------*/
    var year = _parseMonthToYear(month);
    if (year >= 1 && year <= 2)
      return _getData((year > 1) ? 'years' : 'year', year);
    return _getData(DATE_TIME, _time.millisecondsSinceEpoch);
  }

  /// [_parseSecondsToMinutes] parse seconds to minutes
  int _parseSecondsToMinutes(int seconds) {
    var minutes = (seconds / 60);
    return (minutes >= 1) ? minutes.toInt() : 0;
  }

  /// [_parseMinutesToHours] parse minutes to hours
  int _parseMinutesToHours(int minutes) {
    var hours = (minutes / 60);
    return (hours >= 1) ? hours.toInt() : 0;
  }

  /// [_parseHoursToDays] parse hour to days
  int _parseHoursToDays(int hour) {
    var days = (hour / 24);
    return (days >= 1) ? days.toInt() : 0;
  }

  /// [_parseDaysToWeek] parse days to week
  int _parseDaysToWeek(int days) {
    var week = (days / 7);
    return (week >= 1) ? week.toInt() : 0;
  }

  /// [_parseWeekToMonth] parse weeks to month
  int _parseWeekToMonth(int weeks) {
    var month = (weeks / 4);
    return (month >= 1) ? month.toInt() : 0;
  }

  /// [_parseMonthToYear] parse month to years
  int _parseMonthToYear(int months) {
    var year = (months / 12);
    return (year >= 1) ? year.toInt() : 0;
  }
}
