import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music/config/AppConfig.dart';
import 'package:music/config/AppRoutes.dart';

import 'auth/LoginScreen.dart';
import 'auth/LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    print("be");
    var firebaseUser =  FirebaseAuth.instance.currentUser;
print("af");
    return Scaffold(
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child:Text(AppConfig.App_Name,style:  Theme.of(context).textTheme.headline1,)
              ),
            ),
            Expanded(
              child: Center(
                child:Text(firebaseUser.uid!=null?firebaseUser.uid :"no user",style: TextStyle(fontSize: 20),)
              ),
            ),
            FlatButton(
              child: Text("sign up"),
              onPressed: ()
              {
                Navigator.pushNamed(context, AppRoutes.registerRoute);

              },
            ), FlatButton(
              child: Text("sign in"),
              onPressed: ()
              {
                Navigator.pushNamed(context, AppRoutes.loginRoute);

              },
            )

          ],
        ),
    );
  }
}
