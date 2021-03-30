import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music/widgtes/album/AlbumList.dart';

class ExploreScreen extends StatelessWidget {
  var firebaseUser =  FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:AlbumList()

      ),
    );
  }
}
