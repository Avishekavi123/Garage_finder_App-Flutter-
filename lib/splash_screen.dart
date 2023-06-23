import 'package:garage_finder/login_page.dart';
import 'package:garage_finder/services/find_garage.dart';
import 'package:garage_finder/user_page.dart';

import 'main.dart';
import 'package:garage_finder/main.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class splashscreeen extends StatefulWidget {
  const splashscreeen({Key? key}) : super(key: key);

  @override
  State<splashscreeen> createState() => _splashscreeenState();
}



class _splashscreeenState extends State<splashscreeen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{

    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>findgarage(),),);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff3322aa),
                Color(0xff5f2fca),
                Color(0xff3322aa),





              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 160,
                width: 160,
                image: AssetImage('assets/garage_splash.png'),),
              SizedBox(height: 15,),
              Text('Castar-A Garage Finder',style: TextStyle(
                color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 80,),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 10,
                color: Colors.deepPurple,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

