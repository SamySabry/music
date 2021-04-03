import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:music/model/Track.dart';

import 'ExploreProvider.dart';

class ListTracksProvider extends ChangeNotifier {


  String trackLink;
  List<Track> _tracks = <Track>[];
  bool isloaded=false;

  List<Track> get tracks => _tracks;

  void fetchTracks(String trackLink) async {

   // isloaded=false;
    //notifyListeners();
    var url =trackLink;
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      List<dynamic> jsonItems = jsonMap["data"];


      if (jsonItems.length == 0) {
        _tracks= [];
      }
      if(_tracks.length==0)
        {
      jsonItems.forEach((item) {
        var newItem = new Track.fromJson(item);
        _tracks.add(newItem);
      });}

    } else {
      throw Exception("\n\nSomething gone wrong, ${response.statusCode}");
    }

    /// Fetch items from server: pass endping and parameters
    isloaded=true;
    notifyListeners();
  }
}
