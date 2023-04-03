import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileUIWithStack(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfileUIWithStack extends StatelessWidget {
  const ProfileUIWithStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.dehaze)),
        title: const Align(alignment: Alignment.center, child: Text("Profile")),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .31,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/Images/liverpool.jpg"))),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .22,
              left: 0,
              right: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 30,
                      child: Icon(Icons.message),
                    ),
                    CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            radius: 67,
                            backgroundImage:
                                AssetImage("assets/Images/virgil.jpg"))),
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.add,),
                    )
                  ]),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * .42,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Virgil Van Dijk",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Dutch football player",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
