import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_1/local.dart';

class HomeScren extends StatefulWidget {
  HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  Position? position;

  Position? longitude;

  Position? latitude;
  double? distanceInMeters;
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  void dispose() {
    myController1.dispose();
    myController.dispose();
    super.dispose();
  }

  double? value1;
  double? value2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Latiude',
            ),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                value2 = double.parse(myController.text);
              });
            },
          ),
          TextField(
            controller: myController1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Longitude',
            ),
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                value1 = double.parse(myController1.text);
              });
            },
          ),
          Center(
            child: IconButton(
                onPressed: (() async {
                  LocationPermission permission =
                      await Geolocator.checkPermission();
                  if (permission.name == "denied") {
                    Geolocator.openAppSettings();
                    Geolocator.requestPermission();
                  } else {
                    await determinePosition();
                    try {
                      determinePosition();
                      position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high);

                      // latitude = await Geolocator.getCurrentPosition(
                      //     desiredAccuracy: LocationAccuracy.best);
                      // longitude = await Geolocator.getCurrentPosition(
                      //     desiredAccuracy: LocationAccuracy.best);
                    } catch (erorr) {
                      print(erorr);
                    }
                  }
                  print(value1);
                  print(value2);
                   distanceInMeters = Geolocator.distanceBetween(
                      position!.altitude , position!.latitude,value1!,value2!  );

                  setState(() {});
                }),
                icon: Icon(
                  Icons.location_on,
                  size: 40,
                )),
          ),
          Text("$position"),
          Text("distanceInMeters $distanceInMeters")
        ],
      ),
    );
  }
}
