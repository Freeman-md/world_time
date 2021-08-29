import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({ Key? key }) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(uri: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(uri: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(uri: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(uri: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(uri: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(uri: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(uri: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(uri: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  print(locations[index].location);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(locations[index].flag)
                )
              )
            ),
          );
        }
      )
    );
  }
}