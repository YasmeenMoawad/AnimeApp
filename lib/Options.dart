import 'package:flutter/material.dart';
import 'package:anime_app/People.dart';
import 'package:anime_app/Species.dart';
import 'package:anime_app/Vehicles.dart';
import 'package:anime_app/Locations.dart';

class Options extends StatelessWidget {
  final String option;
  const Options(this.option,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              switch (option) {
                case 'People':
                  return const People();
                  break;
                case 'Species':
                  return const Species();
                  break;
                case 'Vehicles':
                  return const Vehicles();
                  break;
                case 'Locations':
                  return const Locations();
                  break;
                default:
                  return const People();
              }
            }
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(option,
                  style: const TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 25,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        const Divider(color: Colors.grey, thickness: 2),
      ],
    );
  }
}

