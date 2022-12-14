import 'dart:convert';

List<AnimeData> dataFromJson(String str) => List<AnimeData>.from(json.decode(str).map((x) => AnimeData.fromJson(x)));

String dataToJson(List<AnimeData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class AnimeData {
  AnimeData({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalTitleRomanised,
    required this.image,
    required this.movieBanner,
    required this.description,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.runningTime,
    required this.rtScore,
    required this.people,
    required this.species,
    required this.locations,
    required this.vehicles,
    required this.url,
  });

  String id;
  String title;
  String originalTitle;
  String originalTitleRomanised;
  String image;
  String movieBanner;
  String description;
  String director;
  String producer;
  String releaseDate;
  String runningTime;
  String rtScore;
  List<String> people;
  List<String> species;
  List<String> locations;
  List<String> vehicles;
  String url;


  factory AnimeData.fromJson(Map<String, dynamic> json) => AnimeData(
    id: json["id"],
    title: json["title"],
    originalTitle: json["original_title"],
    originalTitleRomanised: json["original_title_romanised"],
    image: json["image"],
    movieBanner: json["movie_banner"],
    description: json["description"],
    director: json["director"],
    producer: json["producer"],
    releaseDate: json["release_date"],
    runningTime: json["running_time"],
    rtScore: json["rt_score"],
    people: List<String>.from(json["people"].map((x) => x)),
    species: List<String>.from(json["species"].map((x) => x)),
    locations: List<String>.from(json["locations"].map((x) => x)),
    vehicles: List<String>.from(json["vehicles"].map((x) => x)),
    url: json["url"],

  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "original_title": originalTitle,
    "original_title_romanised": originalTitleRomanised,
    "image": image,
    "movie_banner": movieBanner,
    "description": description,
    "director": director,
    "producer": producer,
    "release_date": releaseDate,
    "running_time": runningTime,
    "rt_score": rtScore,
    "people": List<dynamic>.from(people.map((x) => x)),
    "species": List<dynamic>.from(species.map((x) => x)),
    "locations": List<dynamic>.from(locations.map((x) => x)),
    "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
    "url": url,

  };
  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <AnimeData>[];
    for (final animeModelMapped in mappedList) {
      list.add(AnimeData.fromJson(animeModelMapped));
    }
    return list;
  }
}


