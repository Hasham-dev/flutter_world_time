import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String locaiton;
  String time;
  String flag;
  Uri url;

  WorldTime({this.locaiton, this.flag, this.url});

  Future<void> getTime() async {
    print('object');
    // Make the request
    Response response =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties of data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set time propert
    time = now.toString();
  }
}
