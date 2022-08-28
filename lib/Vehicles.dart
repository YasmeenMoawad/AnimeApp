import 'package:flutter/material.dart';
import 'DataOfAllAnime.dart';

class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  var vehiclesData = [];

  @override
  void initState() {
    DataOfAllAnime().fetchJson().then((value){
      setState(() {
        vehiclesData.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("vehicles"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: vehiclesData.length,
          itemBuilder: (BuildContext context, int index){
            final eachPerson = vehiclesData[index];
            return  Text('$eachPerson');
          }),
    );
  }
}
