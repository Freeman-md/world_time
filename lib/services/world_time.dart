import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the UI
  late String time; // the time in that location
  String flag; // url to an asset flag icon
  String uri; // location uri for api enpoint

  WorldTime({ required this.location, required this.flag, required this.uri });

  Future<void> getTime() async {
    
    try {
      // generate the url
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$uri');

      // make the request
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      
      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      
      // set the time property
      time = now.toString();
    } catch (e) {
      print('Caught Error: $e');
      time = 'could not get time data';
    }

  }

}