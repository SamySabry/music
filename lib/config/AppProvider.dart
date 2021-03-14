import 'package:music/providers/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/*
 *  Providers
 * 
 *  List of provider that we want to init on app start
 *  you can add or remove provider according to your 
 *  requirments. Or you can use provider on any build
 *  widget. Please check providers docs for more details
 *   
 *  https://pub.dev/packages/provider
 */

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
    ),

  ];
}
