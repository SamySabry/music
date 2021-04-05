import 'package:flutter/cupertino.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class PlayerProvider extends ChangeNotifier
{
  AssetsAudioPlayer player= AssetsAudioPlayer();
  bool _isTrackLoaded = true;


  bool get isTrackLoaded => _isTrackLoaded;

  set isTrackLoaded(bool value) {
    _isTrackLoaded = value;
  }

  isTrackInProgress(String url) {
    return player.isPlaying.value &&
        player.current.value != null &&
        player.current.value.audio.assetAudioPath == url;
  }
  handlePlayButton({url}) async {

    try {
      if (isTrackInProgress(url)) {
        player.pause();
      } else {
        _isTrackLoaded = false;
        notifyListeners();
        await player.open(
          Audio.network(url),
        );
        _isTrackLoaded = true;
        notifyListeners();
      }
    } catch (t) {
      //mp3 unreachable
    }
  }

  playOrPause() async {
    try {
      await player.playOrPause();
    } catch (t) {}
  }

}