import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:music/providers/PlayerProvider.dart';

import 'package:provider/provider.dart';

class TrackPlayButton extends StatelessWidget {
  String url;

  TrackPlayButton({this.url});

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<PlayerProvider>(context, listen: false);

    return PlayerBuilder.isPlaying(
        player: p.player,
        builder: (context, isPlaying) {
          return SizedBox(
            height: 40,
            width: 40,
            child: !p.isTrackLoaded
                ? Padding(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                    padding: EdgeInsets.all(10))
                : IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: p.isTrackInProgress(url)
                        ? Icon(AntDesign.pausecircleo)
                        : Icon(
                            SimpleLineIcons.control_play,
                          ),
                onPressed: ()
                {
                  p.handlePlayButton(url: url);
                }),
          );
        });
  }
}
