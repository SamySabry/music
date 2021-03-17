import 'package:flutter/material.dart';
import 'package:music/config/AppRoutes.dart';
import 'package:music/providers/AuthProvider.dart';
import 'package:music/providers/themeProvider.dart';
import 'package:provider/provider.dart';

class UserAccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);

    var themeProvider = Provider.of<ThemeProvider>(context);
    return new Scaffold(
      appBar: new AppBar(
        title: Text('account',
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ),
      body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: ListTile(
                           title: Text(provider.user.firstName),
                            subtitle: Text(provider.user.email),
                            trailing: Icon(Icons.edit),
                            onTap: () {}
                            ),),
                  SizedBox(height: 10),
                    Card(
                      elevation: 2,
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('your_payments',),
                            leading: Icon(
                              Icons.monetization_on,
                              size: 22,
                            ),
                            onTap: () => {},
                          ),
                          Divider(height: 0),
                          ListTile(
                            title: Text('save_payments',),
                            leading: Icon(
                              Icons.credit_card,
                              size: 22,
                            ),
                            onTap: () => {},
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 10),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('help'),
                          leading: Icon(
                            Icons.help,
                            size: 22,
                          ),
                          onTap: () => {},
                        ),
                        Divider(height: 0),
                        ListTile(
                          title: Text('rate'),
                          leading: Icon(
                            Icons.star,
                            size: 22,
                          ),
                          onTap: () => {},
                        ),
                        Divider(height: 0),
                        ListTile(
                          title: Text('about',),
                          leading: Icon(
                            Icons.info,
                            size: 22,
                          ),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                    Card(
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text('sign_out',),
                            leading: Icon(
                              Icons.account_circle,
                              size: 22,
                            ),
                            onTap: () {
                              provider.logout();
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
            }
      ),
                        ],
                      ),
                    ),
                  Card(
                    margin: EdgeInsets.all(0),
                    child: ListTile(
                      title: Text('mode_String',),
                      trailing: Switch(
                          value: themeProvider.darkMode,
                          onChanged: (val) {
                            themeProvider.toggleChangeTheme();
                          }),
                      leading: Icon(
                        Icons.star,
                        size: 22,
                      ),
                      onTap: () => {},
                    ),
                  ),
                ],
              ),
            )
    );
  }
}
