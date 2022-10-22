// ignore_for_file: camel_case_types, avoid_print, sort_child_properties_last, unused_local_variable, unused_label
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/screens/googlesignin.dart';
import 'package:myapp/screens/home.dart';
import 'package:myapp/screens/resentpassword.dart';
import './signup_Screen.dart';
import 'package:flutter/material.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String Email = "karim@karim.com";

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
                    'Sign in',
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
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resent_password(),
                      ));
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Color(0xffe46b10), fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffe46b10)),
                      child: const Text('Login'),
                      onPressed: () async {
                        if (email == Email) {
                          try {
                            var credential = FirebaseAuth.instance;
                            UserCredential myUser =
                                await credential.signInWithEmailAndPassword(
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
                                      child:
                                          Text("not valide email or password"),
                                    ),
                                  );
                                }));
                          }
                        }
                        // } else {
                        //   try {
                        //     var credential = FirebaseAuth.instance;
                        //     UserCredential myUser =
                        //         await credential.signInWithEmailAndPassword(
                        //             email: email.text, password: password.text);
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => Home_Page(),
                        //         ));
                        //   } catch (e) {
                        //     showDialog(
                        //         context: context,
                        //         builder: ((context) {
                        //           return AlertDialog(
                        //             content: Center(
                        //               child:
                        //                   Text("not valide email or password"),
                        //             ),
                        //           );
                        //         }));
                        //   }
                        // }

                        // print(nameController.text);
                        // print(passwordController.text);
                      })),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Sign_Up();
                        },
                      ));
                    },
                  )
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
