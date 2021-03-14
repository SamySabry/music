import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import 'package:music/config/AppConfig.dart';
import 'package:music/config/AppRoutes.dart';
import 'package:music/config/AppValidation_rules.dart';
import 'package:music/providers/AuthProvider.dart';
import 'package:music/widgtes/BaseBlocButton.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>  {

  final Map<String, dynamic> formData = {'email': null, 'password': null};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormFieldState>();
  var media;

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'f_name',
      ),
      validator: (value) => validateName(value),
      onSaved: (String value) {
        formData['first_name'] = value;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'email'),
      validator: (value) => validateEmail(value),
      onSaved: (String value) {
        formData['email'] = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      key: passKey,
      decoration: InputDecoration(
          labelText: 'Password'),
      validator: (value) => validatePassword(value),
      obscureText: true,
      onSaved: (String value) {
        formData['password'] = value;
      },
    );
  }

  bool _termsChecked = false;
  bool errorShow = true;
  Widget _buildTermsCheck() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: CheckboxListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text('terms'),
        controlAffinity: ListTileControlAffinity.leading,
        value: _termsChecked,
        onChanged: (bool value) => setState(() => _termsChecked = value),
        subtitle: !errorShow
            ? Text(
               'r_field',
                style: TextStyle(color: Color(0xFFe53935), fontSize: 12),
              )
            : null,
        dense: true,
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: InputDecoration(labelText:  'cnfrm_account'),
      validator: (value) =>
          validateConfirmPassword(value, passKey.currentState.value),
      obscureText: true,
    );
  }

  _submit(BuildContext context, AuthProvider provider) async {
    print("/n/n/n/n/n up/n/n/n/n/n/n");

    setState(() {
      errorShow = _termsChecked;
    });
    print("/n/n/n/n/n up/n/n/n/n/n/n");

    if (_formKey.currentState.validate() && _termsChecked) {
      // If all data are correct then save data to out variables
      _formKey.currentState.save();
      formData['AUTH_KEY'] = AppConfig.API_AUTH_KEY;

    await  provider.singUpWithEmail(formData).then((response) {
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
            : Navigator.pushNamed(context, AppRoutes.home);
      });
    } else {
      //   If all data are not valid then start auto validation.
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    var provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('create_new_Account'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: media.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(media.height / 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 90,
                        ),
                       // BaseAppIcon(),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                _buildNameField(),
                                _buildEmailField(),
                                _buildPasswordField(),
                                _buildConfirmPasswordField(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildTermsCheck(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: media.height / 20, vertical: 20),
                    child: BaseBlockButton(
                      isLoaded: provider.check,
                      color: Theme.of(context).primaryColor,
                      label:  'create_new_Account',
                      textColor: Colors.white,
                      onPressed: () => _submit(context, provider),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
