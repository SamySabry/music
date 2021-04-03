import 'package:flutter/material.dart';
import 'package:music/model/Track.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music/providers/FavouritesProvider.dart';
import 'package:provider/provider.dart';



class TrackTile extends StatelessWidget {
  final Track track;
  TrackTile({this.track});

  @override
  Widget build(BuildContext context) {
    FavouritesProvider favouriteProvider = Provider.of<FavouritesProvider>(context);

    return Column(children: <Widget>[
      ListTile(
        onTap: ()
        {},
        title: Text(
          track.titleShort,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(
          track.artist.name,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant),
        ),
        leading: Icon(SimpleLineIcons.control_play),
        trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                track.duration,
                style: TextStyle(fontSize: 11),
              ),
              IconButton(
                  icon: Icon(
                      AntDesign.heart
                  ),
                  iconSize: 20,
                  color:Theme.of(context).primaryColor,
                  onPressed: () {
                    favouriteProvider.changeStateTrack(track);
                  }),

              Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
            ]),
      ),
      Divider(
        color: Theme.of(context).cardColor,
      ), //
    ]);
  }
}
