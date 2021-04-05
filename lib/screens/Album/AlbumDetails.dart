import 'package:flutter/material.dart';
import 'package:music/model/Album.dart';
import 'package:music/providers/FavouritesProvider.dart';
import 'package:music/providers/listTracksProvider.dart';
import 'package:music/widgtes/CustomCircularProgressIndicator.dart';
import 'package:music/widgtes/Track/TrackFavouriteButton.dart';
import 'package:music/widgtes/Track/TrackPlayButton.dart';
import 'package:music/widgtes/common/Image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AlbumDetails extends StatefulWidget {
  @override
  _AlbumDetailsState createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  @override
  double heightScreen;
  double paddingBottom;
  double width;

  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    heightScreen = mediaQueryData.size.height;
    paddingBottom = mediaQueryData.padding.bottom;
    width = mediaQueryData.size.width;

    Album album = ModalRoute
        .of(context)
        .settings
        .arguments;
    // ListTracksProvider trackProvider = Provider.of<ListTracksProvider>(context);
    //trackProvider.fetchTracks(album.tracklist);
    //  Provider.of<ExploreProvider>(context,listen: false).fetchTracks();

    // var exploreProvider = Provider.of<ExploreProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => ListTracksProvider(),
        child: Consumer<ListTracksProvider>(
            builder: (context, value, child) {
              value.fetchTracks(album.tracklist);
              return Scaffold(

                  body: Column(
                      children: [
                        Stack(
                          children: [
                            BaseImage(
                              imageUrl: album.cover,
                              height: heightScreen / 3,
                              width: width,
                              radius: 0,
                              overlay: true,
                              overlayOpacity: 0.1,
                              overlayStops: [0.3, 0.8],
                            ),
                            Positioned(
                                top: heightScreen / 4.5,
                                width: width,

                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              album.title,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Spacer(),

                                          ],
                                        ),
                                      ],
                                    )))
                          ],
                        ), Expanded(
                          flex: 2,
                          child: Provider
                              .of<ListTracksProvider>(context)
                              .isloaded & Provider.of<FavouritesProvider>(context)
                              .isLoaded?
                          //  true?

                          ListView.builder(
                              itemCount: value.tracks.length,
                              itemBuilder: (context, index) {
                                return Column(children: <Widget>[
                                    ListTile(
                                    onTap: ()
                                {},
                                title: Text(
                                value.tracks[index].titleShort,
                                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                                ),
                                subtitle: Text(
                                value.tracks[index].artist.name,
                                style: TextStyle(
                                color: Theme.of(context).colorScheme.primaryVariant),
                                ),
                                leading: TrackPlayButton(url:value.tracks[index].preview),
                                trailing: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                Text(
                                value.tracks[index].duration,
                                style: TextStyle(fontSize: 11),
                                ),
                                  TrackFavouriteButton(value.tracks[index],20.0),

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
                              })
                              : CustomCircularProgressIndicator(),
                        )
                      ]
                  )
              );
            }));
  }
}
