
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_finder/main.dart';
import 'package:garage_finder/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:garage_finder/services/test_2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'calculating_distance.dart';
import 'garage_info.dart';


class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {


  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('garage_info');


  Location loc1 = Location(1.2362232, 1.36545) as Location;
  Location loc2 = Location(1.362232, 1.6545) as Location;


  String gemail = "";

  @override
  void initState() {
    super.initState();
  }


  // final databaseRef_longitude = FirebaseDatabase.instance.ref('Longitude');

  final TextEditingController _latitude_of_garage = TextEditingController();
  final TextEditingController _longitude_of_garage = TextEditingController();
  final TextEditingController _garage_name = TextEditingController();
  final TextEditingController _garage_phone = TextEditingController();
  final TextEditingController _garage_email = TextEditingController();


  @override
  Widget build(BuildContext context) {
    List list_colorcode = [
      '0xff90ebb2',
      '0xfff6c33e',
      '0xff1563f',
      '0xfffdeb5b',
      '0xff90ebb2',
      '0xfff6c33e',
      '0xff1563f',
      '0xfffdeb5b',
      '0xff90ebb2',
      '0xfff6c33e',
      '0xff1563f',
      '0xfffdeb5b',
      '0xff90ebb2',
      '0xfff6c33e',
      '0xff1563f',
      '0xfffdeb5b',
      '0xff90ebb2',
      '0xfff6c33e',
      '0xff1563f',
      '0xfffdeb5b',

    ];

    Color color1 = Color(0xff90ebb2);
    Color color2 = Color(0xfff6c33e);
    Color color3 = Color(0xffe1563f);
    Color color4 = Color(0xfffdeb5b);

    List <Color> _list_colors = [

      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,
      color1,
      color2,
      color3,
      color4,

    ];


    return Scaffold(


      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: _garage_name,
                      decoration: InputDecoration(
                        hintText: 'Enter The names',
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: _garage_phone,
                      decoration: InputDecoration(
                        hintText: 'Enter The phone',
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: _garage_email,
                      decoration: InputDecoration(
                        hintText: 'Enter The Email',
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: _latitude_of_garage,
                      decoration: InputDecoration(
                        hintText: 'Enter The latitude',
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextField(
                      controller: _longitude_of_garage,

                      decoration: InputDecoration(

                        hintText: "Enter the longitude",
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(onPressed: () {
                    databaseRef_garageinfo.child(_garage_phone.text.toString())
                        .set(
                        {
                          'id': _garage_email.text.toString().trim(),
                          'gname': _garage_name.text.toString().trim(),
                          'gphone': _garage_phone.text.toString().trim(),
                          'gemail': _garage_email.text.toString().trim(),
                          'glat': _latitude_of_garage.text.toString().trim(),
                          'glong': _longitude_of_garage.text.toString().trim(),
                        });
                    _garage_name.clear();
                    _garage_phone.clear();
                    _garage_email.clear();
                    _latitude_of_garage.clear();
                    _longitude_of_garage.clear();

                    setState(() {


                    });


                    // Navigator.push(context, MaterialPageRoute(builder:(context)=>test_2(),),);

                  },
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.blue,
                      child: Center(child: Text('Submit to firebase')),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      double distance = calculateDistance(loc1, loc2);
                      print("My Distance is " + distance.toString());
                    },
                    child: Container(

                      height: 50,
                      width: 100,
                      color: Colors.deepPurple,
                      child: Text(
                          'Click to test'
                      ),
                    ),
                  ),

                ]
            )
        ),
      ),
    );
  }

}
// void main() {
//   // Example usage
//   Location location1 = Location(23.520008, 13.404954); // Berlin coordinates
//   Location location2 = Location(48.8566, 2.3522); // Paris coordinates
//
//   double distance = calculateDistance(location1, location2);
//   print('The distance between the two locations is ${distance.toStringAsFixed(2)} km.');
// }
