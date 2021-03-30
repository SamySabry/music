import 'dart:convert';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music/model/User.dart' as Person;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  //Constructor
  AuthProvider() {
    autoAuthenticate();
  }

  // Items List

  bool isLoaded = false;
  bool _isLoggedIn = false;
  bool inputerror = false;
  String errorMsg;
  bool check = true;
  Person.User _user;


  Person.User get user => _user;

  bool get isLoggedIn => _isLoggedIn;


  /*
  * Sign in Wiht Email
  * Add your http code here and save user profile.
  */




  /*
  * Logout
  *
  * Clear user preference & user
  */


  /*
  * Sign Up With Email
  * Add your http code here and save user profile.
  */
  Future<String> singUpWithEmail(Person.User user) async {
    isLoaded = false;
    notifyListeners();
    String errorMsg;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: user.email,
          password: user.password
      );
          final firestoreInstance =   FirebaseFirestore.instance;
          print("\n\n\n\n\n\n\n\n");
print(userCredential.user.uid);
      print( user.email);
      print(user.password);
     await firestoreInstance.collection("users").doc(userCredential.user.uid).set({
                "email" : user.email,
                "fname" : user.firstName,
              });

    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          {
            errorMsg = "This email is already in use.";
            isLoaded = false;
          }
          break;
        case "ERROR_WEAK_PASSWORD":
          {
            errorMsg = "The password must be 6 characters long or more.";
            isLoaded = false;
          }
          break;
        default:
          {
            errorMsg = error.code;
          }
      }
    }
    isLoaded = true;
    notifyListeners();
    return errorMsg;
  }


  Future<String> singInWithEmail(Person.User user) async {
    isLoaded = false;
    notifyListeners();
    String errorMsg;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: user.email,
          password: user.password
      );

      final firestoreInstance =   FirebaseFirestore.instance;

      firestoreInstance.collection("users").doc(userCredential.user.uid).get().then((value){
        print(userCredential.user.uid);
        print("\n\n\n\n\n\n\n\n");
        print(value.data());
        set_User(value);
      });


    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "user-not-found":
          {
            errorMsg = "This email not found";
            isLoaded = false;
          }
          break;
        case "wrong-password":
          {
            errorMsg = "check your mail or password";
            isLoaded = false;
          }
          break;
        default:
          {
            errorMsg = "something wrong";
          }
      }
    }
    isLoaded = true;
    notifyListeners();
    return errorMsg;
  }
Future<void> set_User(var doc)
async {
  final _prefs = await SharedPreferences.getInstance();
  _user=Person.User.s(doc.id, doc.data()["email"], doc.data()["fname"]);
  print("good\nn\n\n\n\n");
  _prefs.setString('user', jsonEncode(user));
  _isLoggedIn = true;
notifyListeners();
}


/*
 * Auth Authenticate
 *
 * Auto authentication help to get user data from shared preferences
 * and save as user user object. which can be access anywhere
 * in the app.
 *
 * please check page-user-account.dart for example
 *
 */

  Future autoAuthenticate() async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    String prefUser = _prefs.getString('user');
    if (prefUser != null) {
      _user = Person.User.fromJson(jsonDecode(prefUser));
    }

    if (_user != null) {
      _isLoggedIn = true;
    }
    isLoaded = true;

    notifyListeners();
  }

  /*
  * Logout
  *
  * Clear user preference & user
  */



  void logout() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    _user = null;
    _prefs.clear();
    _isLoggedIn = false;
    notifyListeners();
  }


}