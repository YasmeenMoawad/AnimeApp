
import 'package:anime_app/Data.dart';
import 'package:anime_app/DataOfAllPeople.dart';
import 'package:flutter/material.dart';
import 'DataOfAllAnime.dart';
import 'package:anime_app/PeopleData.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
   final List<PeopleData> peopleDataa = []; // var map = Map<String, dynamic>();

  @override
  void initState() {
    DataOfAllPeople().fetchJson().then((value){
      setState(() {
        peopleDataa.addAll(value);
      });
    });
    super.initState();
  }
/*   Map<String,dynamic> pD(){
    int c = 0;
    for (var item in peopleData){
      map[item['$c']] = peopleData; c++;
    }
    //map = { for (var v in peopleData) v[c.toString()] : v[peopleData] };
    final req = Data.fromJson(map).toJson();
    return req;
  }*/
  //final data = dataFromJson(str);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: peopleDataa.length,
          itemBuilder: (BuildContext context, int index){
        final eachPerson = peopleDataa[index];
        return Text(eachPerson.toString());
      }),
    );
  }
}
