import 'package:flutter/material.dart';
import 'DataOfAllAnime.dart';

class Species extends StatefulWidget {
  const Species({Key? key}) : super(key: key);

  @override
  State<Species> createState() => _SpeciesState();
}

class _SpeciesState extends State<Species> {
  var speciesData = [];

  @override
  void initState() {
    DataOfAllAnime().fetchJson().then((value){
      setState(() {
        speciesData.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Species"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: speciesData.length,
          itemBuilder: (BuildContext context, int index){
            final eachPerson = speciesData[index];
            return  Text('${eachPerson["species"]}');
          }),
    );
  }
}
