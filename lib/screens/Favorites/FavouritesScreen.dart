import 'package:flutter/material.dart';
import 'package:music/providers/FavouritesProvider.dart';
import 'package:music/widgtes/CustomCircularProgressIndicator.dart';
import 'package:music/widgtes/Track/TrackTile.dart';
import 'package:music/widgtes/common/BaseMessageScreen.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget{
  const FavouritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoriteProvider = Provider.of<FavouritesProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body:TrackContainer(favoriteProvider: favoriteProvider),
    );
  }
}

class TrackContainer extends StatelessWidget {
  const TrackContainer({
    Key key,
    @required this.favoriteProvider,
  }) : super(key: key);

  final FavouritesProvider favoriteProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: favoriteProvider.isLoaded
            ?favoriteProvider.favoriteTracks.length > 0
                ? ListView.builder(
                    itemCount: favoriteProvider.favoriteTracks.length,
                    itemBuilder: (context, index) {
                      return TrackTile(
                        track: favoriteProvider.favoriteTracks[index],
                      );
                    },
                  )
            : BaseMessageScreen(
                title:  'no_tracks',
                icon: Icons.data_usage,
                subtitle:'msg_no_tracks',
              )
            : CustomCircularProgressIndicator()
    );

  }
}
