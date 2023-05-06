import 'package:flutter/material.dart';

import 'loginPage.dart';

class SQLHomePage extends StatefulWidget {
  @override
  State<SQLHomePage> createState() => _SQLHomePageState();
}

class _SQLHomePageState extends State<SQLHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/Images/bgnd.jpg"))),
        child: Column(
          children: [
            Center(
              child: Image.asset("assets/Icons/Stream.png"),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SQLLoginPage(),));
            }, child: Text("LOGOUT")),
          ],
        ),
      ),
    );
  }
}
