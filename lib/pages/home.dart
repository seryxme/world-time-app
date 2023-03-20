import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var timeData = ModalRoute.of(context)?.settings.arguments as WorldTime;

    String bgImage = timeData.isDaytime ? 'daytime.jpg' : 'night.jpg';
    Color? bgColor = timeData.isDaytime ? Colors.blue[900] : Colors.lightBlue[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150.0, 0, 0),
              child: Column(
                children: [
                  OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      icon: const Icon(
                          Icons.edit_location,
                        color: Colors.yellow,
                      ),
                    label: const Text(
                        'Choose Location',
                      style: TextStyle(
                        color: Colors.yellow,
                      ),
                    ),

                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          timeData.location,
                        style: const TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                    timeData.time,
                    style: const TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 2.0,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
