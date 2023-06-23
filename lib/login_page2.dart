import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garage_finder/services/find_garage.dart';
import 'package:garage_finder/signup_page_garage.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class loginpage2 extends StatelessWidget {
  const loginpage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController login_garage_email_controller =TextEditingController();
    TextEditingController login_garage_password_controller =TextEditingController();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          title: Text('Login as Garage owner'),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: 190.0,
                padding: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Container(
                    child: Image.asset('assets/garage.jpg'),
                  ),
                ),


              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: login_garage_email_controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Email',
                      hintText: 'Enter valid mail id as abc@gmail.com'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: login_garage_password_controller,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your password'
                  ),
                ),
              ),
              SizedBox(height: 30,),

              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async {

                    var loginemail_user=login_garage_email_controller.text.trim();
                    var loginpass_user=login_garage_password_controller.text.trim();

                    try {
                      final User? firebaseUser=  (await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginemail_user, password: loginpass_user)).user;

                    if(firebaseUser != null){

                    Navigator.push(context, MaterialPageRoute(builder:(context)=> findgarage() ));
                    }
                    else {
                    Fluttertoast.showToast(
                    msg: 'Please enter a valid email and password',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 4,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                    );

                    }

                    }

                    catch(e){
                    print("Can't login ");


                    }

                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    onPrimary: Colors.white,
                    primary: Colors.deepPurple[700],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25),

                      ),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignupPage2()));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 15,
                    onPrimary: Colors.white,
                    primary: Colors.deepPurple[700],
                    minimumSize: const Size(88, 36),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25),

                      ),
                    ),
                  ),
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);

  }
}
