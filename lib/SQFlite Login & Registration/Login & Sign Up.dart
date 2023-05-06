import 'package:flutter/material.dart';
import 'RegistratonPage.dart';
import 'loginPage.dart';


void main() {
  runApp(MaterialApp(
    home: LoginAndSignUP(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginAndSignUP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/Images/bgnd.jpg"))),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .8,
            width: MediaQuery.of(context).size.width * .95,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/Icons/b315.jpg")),
                borderRadius: BorderRadius.circular(15)),
            child: Column(

              children: [
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Icon(
                    Icons.account_circle,
                    size: 180,
                      color: Colors.purple[100],
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SQLLoginPage(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SQlRegistrationPage(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text("SING UP",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
