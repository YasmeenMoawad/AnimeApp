import 'package:flutter/material.dart';
import 'package:anime_app/Options.dart';

class SingleScreen extends StatelessWidget {
  final String title, description ;
  final  img;
  const SingleScreen(this.title , this.img, this.description,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Ink.image(
                  height: MediaQuery.of(context).size.height /4,
                  width: MediaQuery.of(context).size.width ,
                  image: NetworkImage(img),),
                const SizedBox(height: 10,),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    color: Colors.grey,
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 2),
                const Options('People'),
                const Options('Species'),
                const Options('Vehicles'),
                const Options('Locations'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
