import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:garage_finder/main.dart';
import 'package:flutter/material.dart';
import 'package:garage_finder/services/edit_uprofile.dart';



class userprofile extends StatefulWidget {






  userprofile({Key? key}) : super(key: key);

  @override
  State<userprofile> createState() => _userprofileState();
}

class _userprofileState extends State<userprofile> {



  late Timer _timer;


  @override
  void initState() {
    super.initState(
    );
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {

      });
    });
  }






  String data_uname="";
  String data_uphone="";
  String data_uemail="";


  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('user_info');


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
              backgroundColor: Colors.deepPurple,
            ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset('assets/profile.jpg',height: 100,width: 100,),
            Text("Profile",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize:30),),
            SizedBox(
              height: 50,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async {

                  DatabaseEvent event1=await databaseRef_garageinfo.child('601112205678').child('uname').once() ;
                  data_uname="Name: "+ event1.snapshot.value.toString();

                  DatabaseEvent event2=await databaseRef_garageinfo.child('601112205678').child('uphone').once() ;
                  data_uphone="Phone: "+event2.snapshot.value.toString();

                  DatabaseEvent event3=await databaseRef_garageinfo.child('601112205678').child('uemail').once() ;
                  data_uemail="Email: "+event3.snapshot.value.toString();


                  setState(() {

                  });

                },
                child: Card(
                  elevation: 7,
                  child: Container(

                    height: 50,
                    width: 100,

                    color: Colors.deepPurple,
                    child: Center(
                      child: Text('View profile',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                onPressed: ()  {

                 //navigate to edit page

                  Navigator.push(context, MaterialPageRoute(builder:(context)=>editupro()


                  ));

                  }
                  ,
                child: Card(
                  elevation: 7,
                  child: Container(

                    height: 50,
                    width: 100,

                    color: Colors.deepPurple,
                    child: Center(
                      child: Text('Edit Pofile',style: TextStyle(
                        color: Colors.white,
                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(
              height: 60,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(data_uname,style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 20,),

                Text(data_uphone,style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 20,),

                Text(data_uemail,style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),








          ],
        ),

      ),
    );
  }
}
