import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:garage_finder/login_page.dart';
import 'package:garage_finder/services/signup_code.dart';

import 'login_page2.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class SignupPage2 extends StatelessWidget {


  final TextEditingController _name_garage = TextEditingController();
  final TextEditingController _phon_garage= TextEditingController();
  final TextEditingController _email_garage= TextEditingController();
  final TextEditingController _adress_garage_lat= TextEditingController();
  final TextEditingController _adress_garage_long= TextEditingController();
  final TextEditingController _password_garage= TextEditingController();



  @override
  Widget build(BuildContext context) {



    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [

                    Image.asset('assets/garage.jpg',width: 100,height: 100,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text ("Registration",

                          style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                            color: Colors.deepPurple[700],

                        ),),
                        SizedBox(height: 10,),
                        Text("Create an Account",style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),),
                        SizedBox(height: 5,)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            // makeInput(label: "Name"),
                            // makeInput(label: "Mobile Number",obsureText: true),
                            // makeInput(label: "Email",obsureText: true),
                            // makeInput(label: "Adress",obsureText: true)
                            Padding(
                              padding: const EdgeInsets.only(right: 270.0),
                              child: Text("Name",
                              textAlign: TextAlign.left,
                              ),
                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: _name_garage,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                ),
                                hintText: 'Enter your name',
                              ),

                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.only(right: 215.0),
                              child: Text("Mobile Number"),
                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: _phon_garage,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                ),
                                hintText: 'Enter your mobile number',
                              ),
                            ),
                            SizedBox(height: 10,),

                            Padding(
                              padding: const EdgeInsets.only(right: 275.0),
                              child: Text("Email"),
                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: _email_garage,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                ),
                                hintText: 'Enter a valid Email',
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(right: 245.0),
                              child: Text("Paswword",),

                            ),
                            SizedBox(height: 5,),
                            TextField(
                              controller: _password_garage,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurpleAccent
                                  ),
                                ),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                ),
                                hintText: 'Enter a strong password',
                              ),
                            ),
                            SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text("Adress: Enter the latitude and logitude of garage "),
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150,

                                  child: TextField(
                                    controller: _adress_garage_lat,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                      ),
                                      hintText: "Enter latitude"

                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  width: 150,
                                  child: TextField(
                                    controller: _adress_garage_long,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.deepPurpleAccent)
                                      ),
                                      hintText: 'Enter longitude',


                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: EdgeInsets.only(top: 3,left: 3,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border(
                                bottom: BorderSide(color: Colors.black),
                                top: BorderSide(color: Colors.black),
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black)
                            )
                        ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height:60,
                          onPressed: () async{
                            var username=_name_garage.text.trim();
                            var usernum=_phon_garage.text.trim();
                            var useremail=_email_garage.text.trim();
                            var userpassword=_password_garage.text.trim();

                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                email: useremail, password: userpassword).then((value) => {

                              signUpUser(
                                  username,
                                  usernum,
                                  useremail,
                                  userpassword
                              ),

                              // FirebaseFirestore.instance.collection('users').doc().set(
                              //   {
                              //     'username':username,
                              //     'userPhon':usernum,
                              //     'userEmail':useremail,
                              //     'userId': currentuser!.uid
                              //   }
                              // ),
                              // log('created' as num),
                            });
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>loginpage2()));



                          },
                          color: Colors.deepPurple[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,
                            color: Colors.white,

                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?"),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder:(context)=> loginpage2(),),);
                          },
                          child: Text("Login",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                              fontSize: 18
                          ),

                          ),
                        ),
                      ],
                    )
                  ],

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget makeInput({label,obsureText = false}){
//
//
//
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(label,style:TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           color: Colors.black87
//       ),),
//       SizedBox(height: 5,),
//       TextField(
//         controller: ,
//         obscureText: obsureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//                 color: Colors.deepPurpleAccent
//             ),
//           ),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.deepPurpleAccent)
//           ),
//         ),
//       ),
//       SizedBox(height: 15,)
//
//     ],
//   );
// }