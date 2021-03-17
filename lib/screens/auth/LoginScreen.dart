import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:music/config/AppRoutes.dart';
import 'package:music/config/AppValidation_rules.dart';
import 'package:music/model/User.dart';
import 'package:music/providers/AuthProvider.dart';
import 'package:music/widgtes/BaseAppIcon.dart';
import 'package:music/widgtes/BaseBlocButton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  {
  User user= User.inti();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var media;

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.blue,
        labelText:  'email',
      ),
      validator: (value) => validateEmail(value),
      onSaved: (String value) {
        user.email = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'password',
      ),
      validator: (value) => validatePassword(value),
      obscureText: true,
      onSaved: (String value) {
        user.password = value;
      },
    );
  }

  _handleSubmit(BuildContext context, AuthProvider provider) {
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to out variables
      _formKey.currentState.save();

      //Call Auth Provider here...
      provider.singInWithEmail(user).then((response) {
        response != null
            ? Flushbar(
                backgroundColor:
                    Theme.of(context).colorScheme.surface.withOpacity(0.8),
                icon: Icon(
                  Icons.error_outline,
                  color: Theme.of(context).primaryColor,
                ),
                duration: Duration(seconds: 3),
                flushbarPosition: FlushbarPosition.TOP,
                titleText: Text('ops'),
                messageText: Text(response),
              ).show(context)
            : _afterLogin(context, response);
      });
    }
  }

  _afterLogin(BuildContext context, response) {
    if (response == null)
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    else
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(response),
        backgroundColor: Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    var provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('sign_in'),
      ),
      body: Stack(
        children: [

          Container(
            height: media.height,
            padding: EdgeInsets.only(
                top: media.height / 20,
                left: media.height / 20,
                right: media.height / 20),
            child: Form(
              key: _formKey, //Works with statefull widget
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 90),
                    BaseAppIcon(),
                    SizedBox(
                      height: 90,
                    ),
                    SizedBox(height: 20.0),
                    _buildUsernameField(),
                    SizedBox(height: 10.0),
                    _buildPasswordField(),
                    SizedBox(height: 40.0),
                    BaseBlockButton(
                      isLoaded: provider.check,
                      color: Theme.of(context).primaryColor,
                      label: 'sign_in',
                      textColor: Colors.white,
                      onPressed: () => _handleSubmit(context, provider),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        FlatButton.icon(
                          icon: Icon(
                            EvilIcons.arrow_right,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: Text('create_new_Account',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.registerRoute,
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
