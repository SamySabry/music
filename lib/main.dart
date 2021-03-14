import 'package:flutter/material.dart';
import 'package:music/providers/themeProvider.dart';
import 'package:provider/provider.dart';
import 'config/AppProvider.dart';
import 'config/AppRoutes.dart';
import 'config/AppTheme.dart';


void main() {
  runApp(Music());
}

class Music extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers(),
        child: Consumer<ThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Music App',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              routes: AppRoutes().routes(),
              initialRoute: AppRoutes.home,
              themeMode: value.darkMode ? ThemeMode.dark : ThemeMode.light,
              // List all of the app's supported locales here

              // These delegates make sure that the localization data for the proper language is loaded

              // Returns a locale which will be used by the app

            );
          },
        ));
  }
}
