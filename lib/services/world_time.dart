import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String cityUrl;
  bool isDaytime = false;

  WorldTime({
    required this.location,
    required this.flag,
    required this.cityUrl,
  });

  Future<void> getTime() async {
    try {
      var url = Uri.https(
          'worldtimeapi.org', '/api/timezone/$cityUrl', {'q': '{http}'});
      var response = await http.get(url);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      DateTime now = DateTime.parse(datetime);
      if (offset.substring(0,1) == '+') {
        now = now.add(Duration(hours: int.parse(offset.substring(1, 3))));
      } else {
        now = now.subtract(Duration(hours: int.parse(offset.substring(1, 3))));
      }

      isDaytime = now.hour > 5 && now.hour < 19;
      time = DateFormat.jm().format(now);

    } catch (e) {
      print('Error: $e');
      time = 'Error loading time';
    }
  }
}