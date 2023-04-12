import 'package:flutter/material.dart';
import 'Music_Player_Datas.dart';

void main() {
  runApp(MaterialApp(
    home: MusicPlayer(),
    debugShowCheckedModeBanner: false,
  ));
}

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
              child: Text(
            "Musify",
            style: TextStyle(
                color: Colors.pink[100],
                fontWeight: FontWeight.bold,
                fontSize: 28),
          )),
        ),
        body: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Suggested playlists",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.pink[100])),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(
                        3,
                        (index) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(child: Image.asset(musicPlayList[index])),
                            )),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Recommended for you",
                      style: TextStyle(
                          color: Colors.pink[100],
                          fontWeight: FontWeight.bold,
                          fontSize: 23)),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView(
                        children: List.generate(
                      recommendedList.length,
                      (index) => ListTile(
                        title: Text(recommendedTitle[index],
                            style: TextStyle(color: Colors.pink[100])),
                        subtitle: Text("Lady GaGa",
                            style: TextStyle(color: Colors.pink[100])),
                        leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(recommendedList[index])),
                        trailing: Wrap(spacing: 30, children: const [
                          Icon(
                            Icons.star_border,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.download,
                            color: Colors.white,
                          )
                        ]),
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
