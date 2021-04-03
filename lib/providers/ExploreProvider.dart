import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:music/config/AppConfig.dart';

import 'package:music/model/Album.dart';
import 'package:music/model/Track.dart';

class ExploreProvider extends ChangeNotifier {
  ExploreProvider() {
    fetchAlbums();
    //fetchTracks("https://api.deezer.com/album/154241712/tracks");
  }

  Map<String, String> params = {};

  List<Album> _albums = <Album>[];
  List<Album> get albums => _albums;

  void fetchAlbums() async {


    var url =AppConfig.API_URL;
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = json.decode(response.body);

      List<dynamic> jsonItems = jsonMap["data"];
      if (jsonItems.length == 0) {
        _albums= [];
      }
      jsonItems.forEach((item) {
        var newItem = new Album.fromJson(item);
        _albums.add(newItem);
      });

    } else {
      throw Exception("\n\nSomething gone wrong, ${response.statusCode}");
    }

    /// Fetch items from server: pass endping and parameters
    notifyListeners();
  }

  }
