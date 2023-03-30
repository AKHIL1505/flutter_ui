import 'package:flutter/material.dart';
import 'gridWithCard_Details.dart';

void main() {
  runApp(
    MaterialApp(
      home: GridViewWithCard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          cardColor: Colors.green,
          cardTheme: CardTheme(
            shape: OutlineInputBorder(
                // borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30)),
          ),
          iconTheme: const IconThemeData(size: 40, color: Colors.black26)),
    ),
  );
}

class GridViewWithCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: Colors.white24,
        body: Padding(
      padding: const EdgeInsets.only(top: 30, right: 5, left: 5),
      child: GridView.builder(
        itemCount: gridData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2, mainAxisSpacing: 9, crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            elevation: 30,
            shadowColor: Colors.yellow,
            color: cardColors[index],
            child: Align(
              alignment: Alignment.center,
              child: ListTile(
                leading: gridIcons[index],
                title: Text(
                  gridData[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
