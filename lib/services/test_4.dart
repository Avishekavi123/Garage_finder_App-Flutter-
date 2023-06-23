import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:garage_finder/main.dart';
import 'package:flutter/material.dart';
import 'find_garage.dart';
import 'garage_info.dart';

class animatedlist extends StatelessWidget {

  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('garage_info');



  animatedlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Expanded(
        child: FirebaseAnimatedList(
            scrollDirection: Axis.vertical,

            query: databaseRef_garageinfo,

            itemBuilder: (context, snapshot, animation, index) {
              return Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5),
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
                        color: Colors.cyan,
                      ),

                      child: Center(
                        child: ListTile(

                          onTap: () {


                          },


                          tileColor: Colors.white,
                          subtitle: Text(
                            '\nBook garage', style: TextStyle(

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
                              child: Image.asset(
                                garage_images_markers[index + 5],
                                width: 60, height: 60,)),
                          trailing: Text(
                            ratings_of_garage[index + 5].toString(),
                            style: TextStyle(color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          title: Text(snapshot
                              .child('gname')
                              .value
                              .toString(), style: TextStyle(
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
            }),


      ),
    );
  }
}
