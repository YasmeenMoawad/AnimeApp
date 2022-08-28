
import 'SingleScreen.dart';
import 'package:anime_app/Data.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/DataOfAllAnime.dart';


class AllAnimeScreen extends StatefulWidget {
  const AllAnimeScreen({Key? key}) : super(key: key);

  @override
  State<AllAnimeScreen> createState() => AllAnimeScreenState();
}

class AllAnimeScreenState extends State<AllAnimeScreen>{
  final List<AnimeData> allAnime = [];

  @override
  void initState() {
    DataOfAllAnime().fetchJson().then((value){
      setState(() {
        allAnime.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Anime Films"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: allAnime.length,
        itemBuilder: (BuildContext context, int index){
          final anime = allAnime[index];
          return Column(
              children: [
                ElevatedButton(
                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      SingleScreen(anime.title,anime.movieBanner,anime.description)));},
                  child:anime.movieBanner.isEmpty? const Center(child: CircularProgressIndicator(color: Colors.white,),):
                  Ink.image(
                    height: MediaQuery.of(context).size.height /4,
                    width: MediaQuery.of(context).size.width ,
                      image: NetworkImage(anime.movieBanner),
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "${anime.title}\n${anime.originalTitle}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  anime.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 15,),
              ],
          );
        },
      ),
    );
  }
}
