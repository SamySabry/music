import 'Artist.dart';

class Track {
  Track({
    this.id,
    this.titleShort,
    duration,
    this.trackPosition,
    this.preview,
    this.artist,
  }){
    this.duration= ((duration/60).round()).toString()+" : "+(duration%60).toString();
  }

  int id;
  String titleShort;
  String duration;
  int trackPosition;
  String preview;
  Artist artist;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    id: json["id"],
    titleShort: json["title_short"],
    duration: json["duration"],
    trackPosition: json["track_position"],
    preview: json["preview"],
    artist: Artist.fromJson(json["artist"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_short": titleShort,
    "duration": duration,
    "track_position": trackPosition,
    "preview": preview,
    "artist": artist.toJson(),
  };
}
