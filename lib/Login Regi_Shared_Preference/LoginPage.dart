import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';
import 'SignUpPage.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPass = true;

  final loginMailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  late SharedPreferences sharedPreferencesObject;

  late String storedEmail;
  late String storedPassword;
  late String storedName;
  late bool newUserLogin;

  @override
  void initState() {
    checkUserAlreadyLogin();
    getUserValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SizedBox(
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
                child: Icon(Icons.home, color: Colors.indigo, size: 80),
              )),
            ),
            Positioned(
              top: 330,
              left: 25,
              child: Container(
                height: MediaQuery.of(context).size.height * .32,
                width: MediaQuery.of(context).size.width * .87,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black)],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: loginMailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            labelText: 'EMAIL',
                            border: OutlineInputBorder())),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: loginPasswordController,
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
                                : Icons.visibility),
                          ),
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder()),
                      obscuringCharacter: '*',
                      obscureText: showPass,
                    ),
                  ),
                ]),
              ),
            ),
            Positioned(
                top: 560,
                left: 72,
                child: ElevatedButton(
                    onPressed: () {
                      String loginEmailData = loginMailController.text;
                      String loginPasswordData = loginPasswordController.text;

                      if (loginEmailData != '' &&
                          loginPasswordData != '' &&
                          loginEmailData == storedEmail &&
                          loginPasswordData == storedPassword) {
                        print("Successfull");
                        sharedPreferencesObject.setBool('newUserLogin', false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.indigo),
                        fixedSize:
                            const MaterialStatePropertyAll(Size(250, 55)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
            Positioned(
              top: 650,
              left: 80,
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Text("FORGOT PASSWORD")),
                  Row(
                    children: [
                      Text("DON'T HAVE AN ACCOUNT ?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ));
                          },
                          child: Text("SIGN UP"))
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void checkUserAlreadyLogin() async {
    sharedPreferencesObject = await SharedPreferences.getInstance();
    newUserLogin = sharedPreferencesObject.getBool('newUserLogin') ?? true;
    if (newUserLogin == false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  }

  void getUserValues() async {
    sharedPreferencesObject = await SharedPreferences.getInstance();
    setState(() {
      storedName = sharedPreferencesObject.getString('signUpNameData')!;
      storedEmail = sharedPreferencesObject.getString('signUpEmailData')!;
      storedPassword = sharedPreferencesObject.getString('signUpPasswordData')!;
    });
  }
}
