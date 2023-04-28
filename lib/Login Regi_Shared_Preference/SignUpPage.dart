import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPass = true;
  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  late SharedPreferences sharedPreferencesObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
              Color(0xFF1A237A),
              Color(0xFF1565C0),
              Color(0xFF1976D2),
              Color(0xFF64B5F6)
            ])),
            height: MediaQuery.of(context).size.height * .5,
            width: double.infinity,
            child: const Center(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Icon(Icons.account_circle, color: Colors.indigo, size: 80),
            )),
          ),
          Positioned(
            top: 330,
            left: 25,
            child: Container(
              height: MediaQuery.of(context).size.height * .47,
              width: MediaQuery.of(context).size.width * .87,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      controller: signUpEmailController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.email),
                          labelText: 'EMAIL',
                          border: OutlineInputBorder())),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      controller: signUpNameController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.account_circle),
                          labelText: 'NAME',
                          border: OutlineInputBorder())),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.phone),
                          labelText: 'PHONE NUMBER',
                          border: OutlineInputBorder())),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                      obscuringCharacter: '*',
                      obscureText: showPass,
                      controller: signUpPasswordController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (showPass) {
                                    showPass = false;
                                  } else {
                                    showPass = true;
                                  }
                                });
                              },
                              icon: Icon(showPass == true
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder())),
                ),
              ]),
            ),
          ),
          Positioned(
              top: 683,
              left: 72,
              child: ElevatedButton(
                  onPressed: () {
                    signUpFunction();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.indigo),
                      fixedSize: const MaterialStatePropertyAll(Size(250, 55)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            top: 740,
            left: 80,
            child: Row(
              children: [
                const Text("ALREADY HAVE AN ACCOUNT"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: Text("LOGIN"))
              ],
            ),
          )
        ]),
      ),
    );
  }

  void signUpFunction() async {
    sharedPreferencesObject = await SharedPreferences.getInstance();

    String signUpNameData = signUpNameController.text;
    String signUpEmailData = signUpEmailController.text;
    String signUpPasswordData = signUpPasswordController.text;
    if (signUpNameData != '' &&
        signUpEmailData != '' &&
        signUpPasswordData != '') {
      sharedPreferencesObject.setString("signUpNameData", signUpNameData)!;
      sharedPreferencesObject.setString("signUpEmailData", signUpEmailData)!;
      sharedPreferencesObject.setString(
          "signUpPasswordData", signUpPasswordData)!;

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    }
  }
}
