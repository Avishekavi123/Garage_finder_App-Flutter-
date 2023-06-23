

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../login_page2.dart';



signUpUser(

    String username,
    String usernum,
    String useremail,
    String userpassword)
async
{
  User? userid=FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set(
        {
          'username':username,
          'userPhon':usernum,
          'userEmail':useremail,
          'userId': userid.uid
        }).then((value) => {
       FirebaseAuth.instance.signOut(),
    });
  }
  on FirebaseAuthException  catch(e){
    print('Error $e');
  }



}