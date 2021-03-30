
class Artist {
  Artist({
    this.id,
    this.name,
    this.tracklist,
  });

  int id;
  String name;
  String tracklist;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
    tracklist: json["tracklist"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "tracklist": tracklist,
  };
}