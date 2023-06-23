import 'package:flutter/material.dart';
import 'package:garage_finder/login_page.dart';
import 'package:garage_finder/services/find_garage.dart';
import 'package:garage_finder/services/firabase_animated_list.dart';
import 'package:garage_finder/services/test.dart';
import 'package:garage_finder/services/test_2.dart';
import 'package:garage_finder/services/edit_uprofile.dart';
import 'package:garage_finder/services/test_4.dart';
import 'package:garage_finder/services/user_profile.dart';
import 'package:garage_finder/signup_page_garage.dart';
import 'package:garage_finder/signup_page_user.dart';
import 'package:garage_finder/splash_screen.dart';
import 'package:garage_finder/user_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'login_page2.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Garage Finder",
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home:  findgarage(),
    );
  }
}
