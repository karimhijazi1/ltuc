// ignore_for_file: override_on_non_overriding_member

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/login_screen.dart';

class Resent_password extends StatefulWidget {
  const Resent_password({super.key});

  @override
  State<Resent_password> createState() => _Resent_passwordState();
}

class _Resent_passwordState extends State<Resent_password> {
  TextEditingController email = TextEditingController();
  @override
  Future passwordresent() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("password reset successfully check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("inter your email to resent the password")),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
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
                child: const Text('resent password'),
                onPressed: passwordresent,
              )),
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
      ),
    );
  }
}
