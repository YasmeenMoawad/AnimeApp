import 'dart:convert';
import 'package:anime_app/PeopleData.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/Data.dart';
import 'package:http/http.dart' as http;

class DataOfAllPeople with ChangeNotifier {

  Future<List<PeopleData>> fetchJson() async{
    var response = await http.get(Uri.parse("https://ghibliapi.herokuapp.com/people"));
    List<PeopleData> message = [];
    if(response.statusCode == 200){
      final result = json.decode(response.body);
      notifyListeners();
      if(result is Map<String, dynamic>){
        final req = PeopleData.fromJson(result);
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


