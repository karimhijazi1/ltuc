import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Update_component extends StatelessWidget {
  const Update_component({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    TextEditingController courseController = TextEditingController();

    return Container(
      child: ListView(children: [
        Center(
          child: Text("Add the student information "),
        ),
        Text("ID of student"),
        TextField(
          controller: idController,
        ),
        Text("Name of student"),
        TextField(
          controller: nameController,
        ),
        Text("course of student"),
        TextField(
          controller: courseController,
        ),
        TextButton(
            onPressed: () async {
              final usercollection =
                  FirebaseFirestore.instance.collection("users");
              final docRef = usercollection.doc("EpSTIhnGbnl7ZMbSmBwr");

              await docRef.update({
                'id': idController.text,
                'name': nameController.text,
                'course': courseController.text
              });
            },
            child: Text("update the student "))
      ]),
    );
  }
}
