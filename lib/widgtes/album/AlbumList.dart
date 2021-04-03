import 'package:flutter/material.dart';
import 'package:music/config/AppRoutes.dart';
import 'package:music/model/Album.dart';
import 'package:music/providers/ExploreProvider.dart';
import 'package:provider/provider.dart';

import 'AlbumTile.dart';

class AlbumList extends StatelessWidget {

  _buildGridItem(BuildContext context, Album album) => InkWell(
    onTap: () async {


      Navigator.of(context).pushNamed(
        AppRoutes.albumDetails,
        arguments: album,
      );
    },
    child: AlbumTile(album: album),
  );
  final ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var exploreProvider = Provider.of<ExploreProvider>(context);
    return  ListView(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),

          controller: scrollController,
          itemCount: exploreProvider.albums.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:0.8)
          ,itemBuilder: (context, index) {
          return _buildGridItem(context, exploreProvider.albums[index]);
        },
        ),


      ],
    );

  }
}
