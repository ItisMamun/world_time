import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =
        await get('https://worldtimeapi.org/api/timezone/Asia/Dhaka');
    Map data = jsonDecode(response.body);
    // print(data);

    String dateTime = data['utc_datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    // print(dateTime);
    // print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
