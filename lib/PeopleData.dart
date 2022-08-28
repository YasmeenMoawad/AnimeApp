import 'dart:convert';

List<PeopleData> httpsGhibliapiHerokuappComPeopleFromJson(String str) => List<PeopleData>.from(json.decode(str).map((x) => PeopleData.fromJson(x)));

String httpsGhibliapiHerokuappComPeopleToJson(List<PeopleData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PeopleData {
  PeopleData({
    required this.id,
    required this.name,
    //required this.gender,
    required this.age,
    required this.eyeColor,
    required this.hairColor,
    required this.films,
    required this.species,
    required this.url,
    //required this.gander,
  });

  String id;
  String name;
  //Nder gender;
  String age;
  String eyeColor;
  String hairColor;
  List<String> films;
  String species;
  String url;
  //Nder gander;

  factory PeopleData.fromJson(Map<String, dynamic> json) => PeopleData(
    id: json["id"],
    name: json["name"],
    //gender: json["gender"] == null ? null : nderValues.map[json["gender"]],
    age: json["age"],
    eyeColor: json["eye_color"],
    hairColor: json["hair_color"],
    films: List<String>.from(json["films"].map((x) => x)),
    species: json["species"],
    url: json["url"],
    //gander: json["gander"] == null ? null : nderValues.map[json["gander"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    //"gender": gender == null ? null : nderValues.reverse[gender],
    "age": age,
    "eye_color": eyeColor,
    "hair_color": hairColor,
    "films": List<dynamic>.from(films.map((x) => x)),
    "species": species,
    "url": url,
    //"gander": gander == null ? null : nderValues.reverse[gander],
  };

  static parseList(List<Map<String, dynamic>> mappedList) {
    final list = <PeopleData>[];
    for (final animeModelMapped in mappedList) {
      list.add(PeopleData.fromJson(animeModelMapped));
    }
    return list;
  }
}

/*
enum Nder { MALE, FEMALE, NA }

final nderValues = EnumValues({
  "Female": Nder.FEMALE,
  "Male": Nder.MALE,
  "NA": Nder.NA
});


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
*/
