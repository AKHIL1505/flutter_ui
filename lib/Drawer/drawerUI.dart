import 'package:flutter/material.dart';
import 'package:flutter_ui/Drawer/Drawer%20Datas.dart';

void main() {
  runApp(MaterialApp(
    home: DrawerUI(),
    debugShowCheckedModeBanner: false,
  ));
}

class DrawerUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer UI")),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.pink, Colors.purple, Colors.deepOrange]),
          ),
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.transparent),
                  accountName: Text("Jango",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  accountEmail: Text("jango@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/Icons/salim kumar.jpg"),
                  )),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(drawerOptions[index],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        leading: drawerIcons[index],
                      );
                    },
                    itemCount: drawerOptions.length),
              ),
              Positioned(
                  bottom: 20,
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Text("Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
