import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garage_finder/main.dart';
import 'package:garage_finder/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:garage_finder/services/test_2.dart';


class editupro extends StatefulWidget {
  const editupro({Key? key}) : super(key: key);

  @override
  State<editupro> createState() => _edituproState();
}

class _edituproState extends State<editupro> {


  final databaseRef_garageinfo = FirebaseDatabase.instance.ref('user_info');

  String gemail = "";

  @override
  void initState() {
    super.initState();
  }


  // final databaseRef_longitude = FirebaseDatabase.instance.ref('Longitude');

  final TextEditingController _user_name = TextEditingController();
  final TextEditingController _user_phone = TextEditingController();
  final TextEditingController _user_email = TextEditingController();


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

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Edit Profile"),
      ),
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
                    controller: _user_name,
                    decoration: InputDecoration(
                      hintText: 'Enter The name',
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
                    controller: _user_phone,
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
                    controller: _user_email,
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
                  height: 50,
                ),
                MaterialButton(onPressed: () {
                  databaseRef_garageinfo.child("601112205678").update(
                      {
                        // 'id': _user_phone.text.toString().trim(),
                        'uname': _user_name.text.toString().trim(),
                        'uphone': _user_phone.text.toString().trim(),
                        'uemail': _user_email.text.toString().trim(),

                      });
                  _user_name.clear();
                  _user_phone.clear();
                  _user_email.clear();
                  setState(() {


                  });


                  // Navigator.push(context, MaterialPageRoute(builder:(context)=>test_2(),),);

                },
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.deepPurple,
                    child: Center(child: Text('Save the Profile info',style: TextStyle(
                      color: Colors.white,
                    ),)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),



              ],
            ),
          )
      ),
      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 180,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.white),
      //           borderRadius: BorderRadius.circular(10.0),
      //
      //         ),
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 10.0,top: 10),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Center(
      //                 child: Text('Arik Garage',style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),),
      //               ),
      //               SizedBox(height: 10),
      //
      //               // Container(
      //               //   width: 600,
      //               //   height: 300,
      //               //   decoration: BoxDecoration(
      //               //     color: Colors.yellow,
      //               //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //               //
      //               //   ),
      //               //   child: Image.asset(garage_images_markers[i],
      //               //   height: 50,
      //               //   width: 50,
      //               //   // fit: BoxFit.fitWidth,
      //               //     filterQuality: FilterQuality.high,
      //               //   ),
      //               // ),
      //               Row(
      //                 children: [
      //                   Image.asset('assets/garage1.png',
      //                     height: 100,
      //                     width: 100,
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text('Ratting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 5,),
      //                       Row(
      //
      //                         children: [
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.grey,weight: 15),
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //
      //
      //
      //
      //                       // Row(
      //                       //   children: [
      //                       //     // IconButton(onPressed: (){
      //                       //     //
      //                       //     // }, icon: Icon(Icons.call)),
      //                       //     // Text('018104401',style: TextStyle(color: Colors.black,
      //                       //     // fontWeight: FontWeight.bold,
      //                       //     // fontSize: 15),)
      //                       //   ],
      //                       // )
      //                       MaterialButton(
      //
      //                         onPressed: (){},
      //
      //                         child: Container(
      //                           height: 25,
      //                           width: 120,
      //                           child: Text('Book the Garage',style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                           ),),
      //                         ),
      //                         color: Colors.deepPurpleAccent[700],
      //
      //
      //
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //
      //
      //
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: 180,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.white),
      //           borderRadius: BorderRadius.circular(10.0),
      //
      //         ),
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 10.0,top: 10),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Center(
      //                 child: Text('Arik Garage',style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),),
      //               ),
      //               SizedBox(height: 10),
      //
      //               // Container(
      //               //   width: 600,
      //               //   height: 300,
      //               //   decoration: BoxDecoration(
      //               //     color: Colors.yellow,
      //               //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //               //
      //               //   ),
      //               //   child: Image.asset(garage_images_markers[i],
      //               //   height: 50,
      //               //   width: 50,
      //               //   // fit: BoxFit.fitWidth,
      //               //     filterQuality: FilterQuality.high,
      //               //   ),
      //               // ),
      //               Row(
      //                 children: [
      //                   Image.asset('assets/garage1.png',
      //                     height: 100,
      //                     width: 100,
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text('Ratting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 5,),
      //                       Row(
      //
      //                         children: [
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.grey,weight: 15),
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //
      //
      //
      //
      //                       // Row(
      //                       //   children: [
      //                       //     // IconButton(onPressed: (){
      //                       //     //
      //                       //     // }, icon: Icon(Icons.call)),
      //                       //     // Text('018104401',style: TextStyle(color: Colors.black,
      //                       //     // fontWeight: FontWeight.bold,
      //                       //     // fontSize: 15),)
      //                       //   ],
      //                       // )
      //                       MaterialButton(
      //
      //                         onPressed: (){},
      //
      //                         child: Container(
      //                           height: 25,
      //                           width: 120,
      //                           child: Text('Book the Garage',style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                           ),),
      //                         ),
      //                         color: Colors.deepPurpleAccent[700],
      //
      //
      //
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //
      //
      //
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: 180,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.white),
      //           borderRadius: BorderRadius.circular(10.0),
      //
      //         ),
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 10.0,top: 10),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Center(
      //                 child: Text('Arik Garage',style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),),
      //               ),
      //               SizedBox(height: 10),
      //
      //               // Container(
      //               //   width: 600,
      //               //   height: 300,
      //               //   decoration: BoxDecoration(
      //               //     color: Colors.yellow,
      //               //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //               //
      //               //   ),
      //               //   child: Image.asset(garage_images_markers[i],
      //               //   height: 50,
      //               //   width: 50,
      //               //   // fit: BoxFit.fitWidth,
      //               //     filterQuality: FilterQuality.high,
      //               //   ),
      //               // ),
      //               Row(
      //                 children: [
      //                   Image.asset('assets/garage1.png',
      //                     height: 100,
      //                     width: 100,
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text('Ratting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 5,),
      //                       Row(
      //
      //                         children: [
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.grey,weight: 15),
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //
      //
      //
      //
      //                       // Row(
      //                       //   children: [
      //                       //     // IconButton(onPressed: (){
      //                       //     //
      //                       //     // }, icon: Icon(Icons.call)),
      //                       //     // Text('018104401',style: TextStyle(color: Colors.black,
      //                       //     // fontWeight: FontWeight.bold,
      //                       //     // fontSize: 15),)
      //                       //   ],
      //                       // )
      //                       MaterialButton(
      //
      //                         onPressed: (){},
      //
      //                         child: Container(
      //                           height: 25,
      //                           width: 120,
      //                           child: Text('Book the Garage',style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                           ),),
      //                         ),
      //                         color: Colors.deepPurpleAccent[700],
      //
      //
      //
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //
      //
      //
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: 180,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.white),
      //           borderRadius: BorderRadius.circular(10.0),
      //
      //         ),
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 10.0,top: 10),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Center(
      //                 child: Text('Arik Garage',style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),),
      //               ),
      //               SizedBox(height: 10),
      //
      //               // Container(
      //               //   width: 600,
      //               //   height: 300,
      //               //   decoration: BoxDecoration(
      //               //     color: Colors.yellow,
      //               //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //               //
      //               //   ),
      //               //   child: Image.asset(garage_images_markers[i],
      //               //   height: 50,
      //               //   width: 50,
      //               //   // fit: BoxFit.fitWidth,
      //               //     filterQuality: FilterQuality.high,
      //               //   ),
      //               // ),
      //               Row(
      //                 children: [
      //                   Image.asset('assets/garage1.png',
      //                     height: 100,
      //                     width: 100,
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text('Ratting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 5,),
      //                       Row(
      //
      //                         children: [
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.grey,weight: 15),
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //
      //
      //
      //
      //                       // Row(
      //                       //   children: [
      //                       //     // IconButton(onPressed: (){
      //                       //     //
      //                       //     // }, icon: Icon(Icons.call)),
      //                       //     // Text('018104401',style: TextStyle(color: Colors.black,
      //                       //     // fontWeight: FontWeight.bold,
      //                       //     // fontSize: 15),)
      //                       //   ],
      //                       // )
      //                       MaterialButton(
      //
      //                         onPressed: (){},
      //
      //                         child: Container(
      //                           height: 25,
      //                           width: 120,
      //                           child: Text('Book the Garage',style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                           ),),
      //                         ),
      //                         color: Colors.deepPurpleAccent[700],
      //
      //
      //
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //
      //
      //
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         height: 180,
      //         width: 300,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           border: Border.all(color: Colors.white),
      //           borderRadius: BorderRadius.circular(10.0),
      //
      //         ),
      //         child: Padding(
      //           padding:  EdgeInsets.only(left: 10.0,top: 10),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Center(
      //                 child: Text('Arik Garage',style: TextStyle(
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 20,
      //                 ),),
      //               ),
      //               SizedBox(height: 10),
      //
      //               // Container(
      //               //   width: 600,
      //               //   height: 300,
      //               //   decoration: BoxDecoration(
      //               //     color: Colors.yellow,
      //               //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //               //
      //               //   ),
      //               //   child: Image.asset(garage_images_markers[i],
      //               //   height: 50,
      //               //   width: 50,
      //               //   // fit: BoxFit.fitWidth,
      //               //     filterQuality: FilterQuality.high,
      //               //   ),
      //               // ),
      //               Row(
      //                 children: [
      //                   Image.asset('assets/garage1.png',
      //                     height: 100,
      //                     width: 100,
      //                   ),
      //                   SizedBox(width: 10,),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       Text('Ratting',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      //                       SizedBox(height: 5,),
      //                       Row(
      //
      //                         children: [
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15,),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.yellow,weight: 15),
      //                           Icon(Icons.star,color: Colors.grey,weight: 15),
      //
      //                         ],
      //                       ),
      //                       SizedBox(height: 15,),
      //
      //
      //
      //
      //                       // Row(
      //                       //   children: [
      //                       //     // IconButton(onPressed: (){
      //                       //     //
      //                       //     // }, icon: Icon(Icons.call)),
      //                       //     // Text('018104401',style: TextStyle(color: Colors.black,
      //                       //     // fontWeight: FontWeight.bold,
      //                       //     // fontSize: 15),)
      //                       //   ],
      //                       // )
      //                       MaterialButton(
      //
      //                         onPressed: (){},
      //
      //                         child: Container(
      //                           height: 25,
      //                           width: 120,
      //                           child: Text('Book the Garage',style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 15,
      //                             fontWeight: FontWeight.bold,
      //                           ),),
      //                         ),
      //                         color: Colors.deepPurpleAccent[700],
      //
      //
      //
      //                       ),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //
      //
      //
      //
      //
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );


    void _avtivateListeners() {}
  }


}
