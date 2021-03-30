/*
 * AppRoutes
 * 
 * Define all routes for our app. We can access route
 * name as [AppRoutes.myRouteName]  anywhere in our app
 * Add or remove routes according to your requiremnts
 *  
 */

import 'package:flutter/material.dart';
import 'package:music/screens/Album/AlbumDetails.dart';
import 'package:music/screens/HomeScreen.dart';
import 'package:music/screens/auth/LoginScreen.dart';
import 'package:music/screens/auth/RegisterScreen.dart';
import 'package:music/widgtes/common/AuthCheck.dart';

class AppRoutes {
  static const home = 'home';
  static const registerRoute = 'registerRoute';
  static const loginRoute = 'loginRoute';
  static const albumDetails = 'albumDetails';


  Map<String, WidgetBuilder> routes() {
    return {
      home: (context) =>AuthCheck(
        child: HomeScreen(),
        redirect: LoginScreen(),
      ),
      registerRoute: (context) => RegisterScreen(),
      loginRoute: (context) => LoginScreen(),
      albumDetails: (context) => AlbumDetails(),


    };
  }
}
