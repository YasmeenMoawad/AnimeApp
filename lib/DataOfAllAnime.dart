import 'dart:convert';
import 'package:anime_app/PeopleData.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/Data.dart';
import 'package:http/http.dart' as http;

class DataOfAllAnime with ChangeNotifier {

  Future<List<AnimeData>> fetchJson() async{
    var response = await http.get(Uri.parse("https://ghibliapi.herokuapp.com/films"));
    List<AnimeData> message = [];
    if(response.statusCode == 200){
      final result = json.decode(response.body);
      notifyListeners();
      if(result is Map<String, dynamic>){
        final req = AnimeData.fromJson(result);
        return [req];
      }else{
        final dList = AnimeData.parseList(
            result.cast<Map<String, dynamic>>(),);
            return dList;
      }
    }else{
      return message;
    }
  }
}