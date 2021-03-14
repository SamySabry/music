import 'dart:convert';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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

  bool get isLoggedIn => _isLoggedIn;


  /*
  * Sign in Wiht Email
  * Add your http code here and save user profile.
  */



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

    isLoaded = true;

    notifyListeners();
  }

  /*
  * Logout
  *
  * Clear user preference & user
  */


  /*
  * Sign Up With Email
  * Add your http code here and save user profile.
  */
  Future<String> singUpWithEmail(Map<String, dynamic> formData) async {


    isLoaded = false;
    notifyListeners();
    String errorMsg;


    try {
   //   print(formData["email"]);
      // print(formData["password"]);
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: formData["email"],
          password: formData["password"]
      );
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



    //////





/*

    final response = await post('users', formData);
    final Map<String, dynamic> jsonMap = json.decode(response.body);

    if (response.statusCode == 200) {
    }
    else
      if (response.statusCode == 400) {
      error = jsonMap['data']['message'];
    }
    //Todo: Validation error is different on email or password change..
    else
      if (response.statusCode == 422 || response.statusCode == 401) {
      jsonMap['errors'].forEach((key, value) {
        jsonMap['errors'][key] = value;

        error = value[0]; //string interpolation in action
      });
    }
*/
    isLoaded = true;
    notifyListeners();
    return errorMsg;
  }
}}
