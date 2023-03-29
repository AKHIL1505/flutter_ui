import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: const GridViewWithCard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          cardColor: Colors.green,
          cardTheme: CardTheme(
            shape: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )),
          iconTheme: const IconThemeData(size: 50, color: Colors.black26)),
    ),
  );
}

class GridViewWithCard extends StatelessWidget {
  const GridViewWithCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white24,
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: StaggeredGrid.count(
          crossAxisCount: 10,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
          children: [
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.purpleAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.home), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("HOME"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.orange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.mail), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("MAIL"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.lightGreenAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.phone), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("PHONE"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.greenAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt_outlined),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("CAMERA"),
                        )
                      ]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.limeAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.download), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("DOWNLOAD"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.white60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.account_circle), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("ACCOUNT"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.image), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("PICTURE"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.pink,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.delete), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("TRASH"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.indigo,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.send),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("SEND"),
                        )
                      ]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.deepOrange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.search), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("SEARCH"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.teal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.video_call), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("VIDEO"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.green,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.mic_off), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("MUTE"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.purple,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.headphones), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("HEADSET"),
                      )]),
                )),
            StaggeredGridTile.count(
                crossAxisCellCount: 5,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Icon(Icons.volume_down), Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("VOLUME"),
                      )]),
                )),
          ],
        ),
      ),
    ));
  }
}
