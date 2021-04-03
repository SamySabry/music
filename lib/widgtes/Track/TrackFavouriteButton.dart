import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music/model/Track.dart';
import 'package:music/providers/FavouritesProvider.dart';

import 'package:provider/provider.dart';

class TrackFavouriteButton extends StatelessWidget{
  final Track track;
  final double iconSize;
  TrackFavouriteButton(this.track, iconSize)
      : iconSize = iconSize ?? 20;

  @override
  Widget build(BuildContext context) {
    FavouritesProvider favouriteProvider = Provider.of<FavouritesProvider>(context);
    return IconButton(
        icon: Icon(
          favouriteProvider.isFavouitedTrack(track)
              ? AntDesign.heart
              : AntDesign.hearto,
        ),
        iconSize: iconSize,
        color:  favouriteProvider.isFavouitedTrack(track)?Theme.of(context).primaryColor:Theme.of(context).accentColor,
        onPressed: () {
          favouriteProvider.changeStateTrack(track);
        });
  }
}
