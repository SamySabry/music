import 'package:flutter/material.dart';
import 'package:music/providers/AuthProvider.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatelessWidget {
  final Widget child;
  final Widget redirect;
  const AuthCheck({this.child, this.redirect, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context);
    print(provider.isLoggedIn);
    return Container(
      child: provider.isLoggedIn ? child : redirect ,
    );
  }
}
