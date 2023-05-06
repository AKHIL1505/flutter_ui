import 'package:flutter/material.dart';
import 'AdminHomePage.dart';
import 'Login & Sign Up.dart';
import 'SQFliteOperations.dart';
import 'SQLHomePage.dart';



class SQLLoginPage extends StatefulWidget {
  @override
  State<SQLLoginPage> createState() => _SQLLoginPageState();
}

class _SQLLoginPageState extends State<SQLLoginPage> {
  GlobalKey<FormState> formValidKey = GlobalKey();
  bool passValid = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
          child: SingleChildScrollView(
            child: Form(
                key: formValidKey,
                child: Container(
                    height: MediaQuery.of(context).size.height * .41,
                    width: MediaQuery.of(context).size.width * .95,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, right: 30, left: 30),
                      child: Column(children: [
                        const Text("LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.purple),
                            ),
                            validator: (email) {
                              if (email!.isEmpty ||
                                  !email.contains('@') ||
                                  !email.contains('.')) {
                                return 'Enter a valid Email ID';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.purple,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (passValid) {
                                          passValid = false;
                                        } else {
                                          passValid = true;
                                        }
                                      });
                                    },
                                    icon: Icon(passValid == true
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                            obscuringCharacter: '*',
                            obscureText: passValid,
                            validator: (pswd) {
                              if (pswd!.isEmpty || pswd.length < 6) {
                                return 'Enter a valid Password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 17),
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    const MaterialStatePropertyAll(
                                        Size(100, 40)),
                                backgroundColor:
                                    const MaterialStatePropertyAll(
                                        Colors.white24),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                                30)))),
                            onPressed: () {
                              final validationCheck =
                                  formValidKey.currentState!.validate();
                              if (validationCheck) {
                                loginCheck(emailController.text,
                                    passwordController.text);
                              }
                            },
                            child: const Text("LOGIN")),

                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginAndSignUP(),));
                        }, child: Text("Back to Main",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),))
                      ]),
                    ))),
          ),
        ),
      ),
    );
  }

  void loginCheck(String existingEmail, String existingPassword) async {
    if (existingEmail == 'admin@gmail.com' && existingPassword == '123456') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminPage(),
          ));
    } else {
      var existingUserData =
          await SQLHelper.existingUser(existingEmail, existingPassword);
      if (existingUserData.isNotEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SQLHomePage(),
            ));
      } else if (existingUserData.isEmpty) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginAndSignUP(),
            ));
      }
    }
  }
}
