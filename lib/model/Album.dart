
class Album {
  final int id;
  final String title;
  final String cover;
  final String tracklist;

  Album(this.id, this.title, this.cover, this.tracklist);
  factory Album.fromJson(Map<String, dynamic> json)
  {
    return Album(
      json['id'] as int,
      json['title'] as String,
      json['cover_xl'] as String,
      json['tracklist'] as String
    );
  }

}
