import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music/config/AppConfig.dart';
import 'package:music/config/AppRoutes.dart';


import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
          Column(
            children: [
              Expanded(
                child: Center(
                    child:Text(AppConfig.App_Name,style:  Theme.of(context).textTheme.headline1,)
                ),
              ),
              Expanded(
                child: Center(
                    child:Text(firebaseUser!=null?firebaseUser.uid :"no user",style: TextStyle(fontSize: 20),)
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
          )

      ),
    );
  }
}
