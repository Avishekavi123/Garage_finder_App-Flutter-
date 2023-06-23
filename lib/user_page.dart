import 'package:garage_finder/login_page.dart';
import 'package:garage_finder/login_page2.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class userpage extends StatelessWidget {
  const userpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

      appBar:AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text("CASTAR-A GARAGE FINDER"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>loginpage1() ));

                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Image(image: AssetImage('assets/profile.jpg'),
                        height: 100,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 8.0),
                      child: Text("Login as user"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 70,),
            Card(
              elevation: 5,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>loginpage2()));
                },
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 8.0),
                      child: Image(image: AssetImage('assets/garage.jpg'),
                        height: 100,
                        width: 200,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding:  EdgeInsets.only(bottom: 8.0),
                      child: Text("Login as Garage holder"),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    ));
  }
}
