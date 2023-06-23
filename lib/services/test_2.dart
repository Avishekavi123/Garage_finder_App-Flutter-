import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_finder/login_page.dart';
import 'package:garage_finder/main.dart';
import 'package:garage_finder/services/find_garage.dart';
import 'package:garage_finder/services/test.dart';

import '../login_page2.dart';



class test_2 extends StatefulWidget {


  test_2({Key? key}) : super(key: key);

  @override
  State<test_2> createState() => _test_2State();
}

class _test_2State extends State<test_2> {
  String data= '';

  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('garage_info');

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      appBar: AppBar(
        title: Text('test'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          MaterialButton(
            onPressed: () async {

              DatabaseEvent event=await databaseRef_garageinfo.child('1327113017').child('gname').once() ;
               data=event.snapshot.value.toString();
               setState(() {

               });

            },
            child: Container(

              height: 50,
              width: 100,
              color: Colors.blue,
            ),
          ),//This code is for fatch a perticular data form firebase realtime data
          Expanded(
            child: FirebaseAnimatedList(
              scrollDirection: Axis.vertical,

                query: databaseRef_garageinfo,

                itemBuilder:(context,snapshot,animation,index){

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
                        color: Colors.cyan,
                      ),

                      child: Center(
                        child: ListTile(

                          onTap: (){

                            // FlutterPhoneDirectCaller.callNumber(_phoneNumber_of_garage[index]);

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
                              child: Image.asset('assets/garage1.png',width: 60,height: 60,)),
                          trailing: Text(
                            'Avishek',
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



            }),
          ),

          Center(
            child: Container(
              height: 200,
              width: 400,
              color: Colors.deepPurple,
              child: Center(
                child: Text(

                data,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Text(snapshot.child('gphone').value.toString()
//
// Padding(
// padding:  EdgeInsets.only(top: 10.0,left: 15),
// child: MaterialButton(
//
// onPressed: () {
//
//
// },
// child: Container(
// child: ListTile(
// leading: Container(
// height: 100,
// width: 100,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
//
// border: Border.all(
// width: 3,
//
// color: Colors.white
//
// ),
// ),
// child: Image.asset('assets/garage1.png',width: 60,height: 60,)),
//
// title: Text(snapshot.child('gphone').value.toString(),style: TextStyle(
// color: Colors.black,
// ),),
// ),
// ),
// ),
// );