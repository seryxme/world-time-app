import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocationScreen extends StatefulWidget {
  const ChooseLocationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLocationScreen> createState() => _ChooseLocationScreenState();
}

class _ChooseLocationScreenState extends State<ChooseLocationScreen> {

  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', cityUrl: 'Europe/Berlin'),
    WorldTime(location: 'Lagos', flag: 'nigeria.jpg', cityUrl: 'Africa/Lagos'),
    WorldTime(location: 'Los Angeles', flag: 'us.png', cityUrl: 'America/Los_Angeles'),
    WorldTime(location: 'Dubai', flag: 'uae.png', cityUrl: 'Asia/Dubai'),
    WorldTime(location: 'London', flag: 'uk.jpg', cityUrl: 'Europe/London'),
    WorldTime(location: 'Barbados', flag: 'barbados.jpg', cityUrl: 'America/Barbados'),
    WorldTime(location: 'Vancouver', flag: 'canada.png', cityUrl: 'America/Vancouver'),
    WorldTime(location: 'Nairobi', flag: 'kenya.jpg', cityUrl: 'Africa/Nairobi'),
    WorldTime(location: 'New York', flag: 'us.png', cityUrl: 'America/New_York'),
    WorldTime(location: 'Madrid', flag: 'spain.jpg', cityUrl: 'Europe/Madrid'),
    WorldTime(location: 'Accra', flag: 'ghana.jpg', cityUrl: 'Africa/Accra'),
    WorldTime(location: 'Toronto', flag: 'canada.png', cityUrl: 'America/Toronto'),
    WorldTime(location: 'Bangkok', flag: 'thailand.jpg', cityUrl: 'Asia/Bangkok'),
  ];

  Future<void> setupWorldTime(WorldTime timeNow) async {
    await timeNow.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: timeNow);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text('Choose a Location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  await setupWorldTime(locations[index]);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
          }
      ),
    );
  }
}
