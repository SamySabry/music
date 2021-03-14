/*
 * AppRoutes
 * 
 * Define all routes for our app. We can access route
 * name as [AppRoutes.myRouteName]  anywhere in our app
 * Add or remove routes according to your requiremnts
 *  
 */

import 'package:flutter/material.dart';
import 'package:music/screens/HomeScreen.dart';

class AppRoutes {
  static const home = 'home';


  Map<String, WidgetBuilder> routes() {
    return {
      home: (context) => HomeScreen(),
    };
  }
}
