import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilUI(),
    debugShowCheckedModeBanner: false,
  ));
}

var datas = [
  "Privacy",
  "Purchase History",
  "Help & Support",
  "Settings",
  "Invite a Friend",
  "Logout"
];
var proIcons = [
  Icon(Icons.privacy_tip_outlined),
  Icon(Icons.history),
  Icon(Icons.help_outline),
  Icon(Icons.settings),
  Icon(Icons.person_add_alt),
  Icon(Icons.logout)
];

class ProfilUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_circle_left_outlined, color: Colors.black,)),
        backgroundColor: Colors.white10,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.dehaze, color: Colors.black,))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .45,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage("assets/Icons/shami.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Wrap(
                    spacing: 25,
                    children: [
                      IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.facebook, size: 35,)),
                      IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.twitter, size: 35)),
                      IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.linkedin, size: 35)),
                      IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.github, size: 35),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text("Shammi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
                ),
                const Text("@developer",
                    style: TextStyle(fontSize: 15, color: Colors.grey)),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Junior Flutter Developer",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width * .8,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(30)),
                  child: ListTile(
                      title: Text(datas[index],
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                      leading: proIcons[index],
                      trailing: const Icon(Icons.arrow_forward_ios)),
                );
              },
              itemCount: datas.length,
            ),
          )
        ],
      ),
    );
  }
}
