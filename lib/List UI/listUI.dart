import 'package:flutter/material.dart';

import 'Images_and_details.dart';

void main() {
  runApp(MaterialApp(
    home: CitesAroundWorld(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepOrange),
  ));
}

class CitesAroundWorld extends StatelessWidget {
  const CitesAroundWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("Cities Around World"),
              ),
            )),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  color: Colors.orange,
                  child: Row(children: [
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image(
                          fit: BoxFit.fill,
                          height: 130,
                          width: 200,
                          image: AssetImage(image[index])),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Wrap(direction: Axis.vertical, children: [
                        Text(
                          citesName[index],
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(country[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500)),
                        ),
                        Text(population[index]),
                      ]),
                    )
                  ]),
                ),
              );
            },
            itemCount: citesName.length));
  }
}
