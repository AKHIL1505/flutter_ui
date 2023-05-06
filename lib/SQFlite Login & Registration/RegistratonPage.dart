import 'package:flutter/material.dart';

import 'SQFliteOperations.dart';
import 'loginPage.dart';

class SQlRegistrationPage extends StatefulWidget {
  const SQlRegistrationPage({Key? key}) : super(key: key);

  @override
  State<SQlRegistrationPage> createState() => _SQlRegistrationPageState();
}

class _SQlRegistrationPageState extends State<SQlRegistrationPage> {
  GlobalKey<FormState> formValidationKey = GlobalKey();
  bool passValidationObject = true;
  bool passValidationObject2 = true;
  var confirmPassword;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/Images/bgnd.jpg"))),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
                key: formValidationKey,
                child: Container(
                    height: MediaQuery.of(context).size.height * .77,
                    width: MediaQuery.of(context).size.width * .95,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purpleAccent),
                        //color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Column(children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 10),
                        Text("SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        SizedBox(height: 10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  hintText: 'Name',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.purple),
                                  border: OutlineInputBorder()),
                              validator: (uName) {
                                if (uName!.isEmpty) {
                                  return "Enter your Name";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.purple),
                                  border: OutlineInputBorder()),
                              validator: (userEmail) {
                                if (userEmail!.isEmpty ||
                                    !userEmail.contains("@") ||
                                    !userEmail.contains(".")) {
                                  return "Enter a valid Email ID";
                                } else {
                                  return null;
                                }
                              },
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: Colors.purple,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (passValidationObject) {
                                        passValidationObject = false;
                                      } else {
                                        passValidationObject = true;
                                      }
                                    });
                                  },
                                  icon: Icon(passValidationObject == true
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                            obscuringCharacter: '*',
                            obscureText: passValidationObject,
                            validator: (pswd) {
                              confirmPassword = pswd;
                              if (pswd!.isEmpty || pswd.length < 6) {
                                return "Enter a valid Password.";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .7,
                          child: TextFormField(
                            controller: confirmPassController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm Password',
                                fillColor: Colors.white,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.purple,
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (passValidationObject2) {
                                          passValidationObject2 = false;
                                        } else {
                                          passValidationObject2 = true;
                                        }
                                      });
                                    },
                                    icon: Icon(passValidationObject2 == true
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                            obscuringCharacter: '*',
                            obscureText: passValidationObject2,
                            validator: (cPass) {
                              if (cPass != confirmPassword || cPass!.isEmpty) {
                                return "Password mismatch";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size(100, 40)),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white24),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)))),
                            onPressed: () async {
                              final formValid =
                                  formValidationKey.currentState!.validate();

                              if (formValid) {
                                String userEmail = emailController.text;
                                String userName = nameController.text;

                                var data = await SQLHelper.userFound(
                                    userName, userEmail);
                                if (data.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("User Already exist")));
                                } else {
                                  addNewUser(
                                      nameController.text,
                                      emailController.text,
                                      passwordController.text);
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  action: SnackBarAction(
                                      label: 'UNDO', onPressed: () {}),
                                  content: Text("Invalid username or Password"),
                                ));
                              }
                            },
                            child: Text("SIGN UP")),
                        SizedBox(height: 15),
                        const Text(
                          "Alread have account!",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SQLLoginPage(),
                                  ));
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ))
                      ]),
                    ))),
          ),
        ),
      ),
    );
  }

  void addNewUser(
      String newUserName, String newUserEmail, String newUserPassword) async {
    var newUserDetails = await SQLHelper.addNewUserData(
        newUserName, newUserEmail, newUserPassword);
    if (newUserDetails != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SQLLoginPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SQlRegistrationPage(),
          ));
    }
  }
}
