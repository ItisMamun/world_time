import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location of the ui
  String time; // the time in that locaion
  String flag; // url to an asset flag icon
  String url; // location url of the api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    // print(data);

    String dateTime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // print(dateTime);
    // print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set the time property
    time = now.toString();
  }
}
