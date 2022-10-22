// ignore_for_file: sized_box_for_whitespace, library_private_types_in_public_api, file_names, must_be_immutable, override_on_non_overriding_member

// import 'package:citycafe_app/screens/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: _title()),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color(0xffe46b10),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/1.png"))),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffe46b10)),
                      child: const Text('SignUp'),
                      onPressed: () async {
                        try {
                          var credential = FirebaseAuth.instance;
                          // ignore: unused_local_variable
                          UserCredential myUser =
                              await credential.createUserWithEmailAndPassword(
                                  email: email.text, password: password.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sign_Up(),
                              ));
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return AlertDialog(
                                  content: Center(
                                    child: Text("not valide email or password"),
                                  ),
                                );
                              }));
                        }
                        // print(nameController.text);
                        // print(passwordController.text);
                      })),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  const Text('you have acounte'),
                  TextButton(
                    child: const Text(
                      'log in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Login_screen();
                        },
                      ));
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}

Widget _title() {
  return RichText(
    softWrap: false,
    text: TextSpan(
        onEnter: ((event) {
          print("123");
        }),
        text: 'Lt',
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10)),
        children: const [
          TextSpan(
            text: 'uc Stu',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          TextSpan(
            text: 'dents',
            style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
          ),
        ]),
  );
}
