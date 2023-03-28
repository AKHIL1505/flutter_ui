import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/List%20UI/Images_and_details.dart';

void main() {
  runApp(MaterialApp(
    home: HotelBookingUI(),
    debugShowCheckedModeBanner: false,
  ));
}

class HotelBookingUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Images/Hotel bgnd.jpg"),
                fit: BoxFit.fill)),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 380,
                  width: double.maxFinite,
                  child: Image.asset("assets/Images/Taj.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 260,
                  child: Column(
                    children: [
                      const Text("Taj West End",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.lightGreenAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text("Bangalore, India",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  borderRadius: BorderRadius.circular(25)),
                              height: 28,
                              width: 120,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 5,
                                ),
                                child: Text("8.3/466 reviews",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 335, top: 340),
                  child: Icon(Icons.favorite_border,
                      color: Colors.white, size: 28),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              height: 50,
              width: 450,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 2),
                child: Row(
                  children: [
                    Column(children: [
                      Row(children: const [
                        Icon(Icons.star, color: Colors.indigo,),
                        Icon(Icons.star, color: Colors.indigo,),
                        Icon(Icons.star, color: Colors.indigo,),
                        Icon(Icons.star, color: Colors.indigo,),
                        Icon(Icons.star, color: Colors.grey,),
                      ]),
                      Row(
                        children: const [
                          Icon(Icons.location_pin, color: Colors.green,),
                          Text("30 km to Majestic",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          )
                        ],
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 150, top: 7),
                      child: Column(
                        children: const [
                          Text("₹16000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo),
                          ),
                          Text("/per night",
                            style: TextStyle(color: Colors.indigo),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.indigo),
                height: 40,
                width: 300,
                child: const Text("Book Now",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "5 Star Hotel in Bangalore near Race Course Road",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                aboutTajWestEnd,
                style: TextStyle(color: Colors.white),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
