import 'package:flutter/material.dart';
import 'package:flutter_ui/Login%20Regi_Shared_Preference/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferencesObject;
  late String welcomeName;
  late String welcomeEmail;

  @override
  void initState() {
    fetchNameFromSharedPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF1A237A),
          Color(0xFF1565C0),
          Color(0xFF1976D2),
          Color(0xFF64B5F6)
        ])),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .47,
            width: MediaQuery.of(context).size.width * .87,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 40, color: Colors.black)],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "WELCOME",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        label: Text("$welcomeName"),
                        border: OutlineInputBorder())),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        label: Text("$welcomeEmail"),
                        border: OutlineInputBorder())),
              ),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.indigo)),
                  onPressed: () {
                    sharedPreferencesObject.setBool('newUserLogin', true);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: Text("LOGOUT"))
            ]),
          ),
        ),
      ),
    );
  }

  void fetchNameFromSharedPreference() async {
    sharedPreferencesObject = await SharedPreferences.getInstance();
    setState(() {
      welcomeName = sharedPreferencesObject.getString('signUpNameData')!;
      welcomeEmail = sharedPreferencesObject.getString('signUpEmailData')!;
    });
  }
}
