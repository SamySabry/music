
import 'package:flutter/cupertino.dart';
import 'package:music/model/Track.dart';
import 'package:localstorage/localstorage.dart';

class FavouritesProvider  extends ChangeNotifier
{
  static const String trackLocalStorageSearch = 'TrackLocalStorageSearch';
  static const String trackFavoriteList = 'TrackFavoriteList';
  List<Track> _favoriteTracks;
  bool isLoaded = false;


  List<Track> get favoriteTracks => _favoriteTracks;

  set favoriteTracks(List<Track> value) {
    _favoriteTracks = value;
  }

  FavouritesProvider()
  {
    getTracksFromStorage();
  }

  //get all favorites tracks
  getTracksFromStorage()
  async {
    LocalStorage localStorage = LocalStorage(trackLocalStorageSearch);
    await localStorage.ready;
    List<Track> favoriteList =
    (localStorage.getItem(trackFavoriteList) ?? []).map<Track>((item) {
      return new Track.fromJsonStorage(item);
    }).toList();


    _favoriteTracks = favoriteList;
    isLoaded = true;
    notifyListeners();
  }

 changeStateTrack(Track track)
 {

     if(checkContains(track))
     {
       removetrack(track);
     }
   else
     {
       _favoriteTracks.add(track);
     }
   saveData();
   notifyListeners();

 }
  saveData()
  async {
    LocalStorage localStorage = LocalStorage(trackLocalStorageSearch);
    await localStorage.ready;
    localStorage.setItem(trackFavoriteList, _favoriteTracks);

  }

  bool isFavouitedTrack(Track track)
  {
    return checkContains(track);
  }

  bool checkContains(Track track)
  {
    print("\n\n ${track.id}  need to check\n\n");

    for (Track t in _favoriteTracks)
      {
        print(t.id);
        print("\n");
        if(track.id==t.id)
          {
            print("true");
            return true;
          }

      }
    print("false");
    return false;

  }
  removetrack(Track track)
  {
    Track temp;
    for (Track t in _favoriteTracks)
    {

      if(track.id==t.id)
      {
        temp= t;
      }

    }
    _favoriteTracks.remove(temp);
  }
}