import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:garage_finder/main.dart';
import 'package:garage_finder/main.dart';
import 'package:flutter/material.dart';

import 'package:garage_finder/services/calculating_distance.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class firebaseanimatedlist extends StatefulWidget {
  const firebaseanimatedlist({Key? key}) : super(key: key);

  @override
  State<firebaseanimatedlist> createState() => _firebaseanimatedlistState();
}

class _firebaseanimatedlistState extends State<firebaseanimatedlist> {

  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('garage_info');

  Location sourceLocation = Location(1.5655226434866882, 103.60029164489598 );

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Test"),
      ),
      body:Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                scrollDirection: Axis.vertical,

                query: databaseRef_garageinfo,

                itemBuilder:(context,snapshot,animation,index){

                 String firebaselat=snapshot.child('glat').value.toString();
                 String firebaselong=snapshot.child('glong').value.toString();

                  
                  Location test=Location(double.parse(firebaselat),double.parse(firebaselong));
                  
                    
                  double distance=calculateDistance(sourceLocation as Location, test);
        
                  if(distance<=7){
                    

                    return Padding(
                      padding: EdgeInsets.only(top: 5.0,bottom: 5),
                      child: Container(

                        child: Card(
                          elevation: 7,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,

                              ),
                              color: Colors.deepPurple,
                            ),

                            child: Center(
                              child: ListTile(

                                onTap: () async {

                                  FlutterPhoneDirectCaller.callNumber("01815104401");

                                },



                                tileColor: Colors.white,
                                subtitle: Text('\nBook garage',style: TextStyle(

                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),),

                                leading: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,

                                      border: Border.all(
                                          width: 3,

                                          color: Colors.white

                                      ),
                                    ),
                                    child: Image.asset("assets/garage.jpg",width: 60,height: 60,)),
                                trailing:Text(
                                  '5',
                                  style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
                                ),
                                title:Text(snapshot.child('gname').value.toString() ,style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),),

                              ),
                            ),
                          ),
                        ),
                      ),
                    );


                  }

                  return  Container(

                  );
                }





            ),
          )
        ],
      ) 
      

    );
  }
}
void main() {
  // Example usage
  Location location1 = Location(23.520008, 13.404954); // Berlin coordinates
  Location location2 = Location(48.8566, 2.3522); // Paris coordinates

  double distance = calculateDistance(location1, location2);
  print('The distance between the two locations is ${distance.toStringAsFixed(2)} km.');
}

