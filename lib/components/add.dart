import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_component extends StatelessWidget {
  const Add_component({super.key});

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
            onPressed: () {
              CollectionReference studentRef =
                  FirebaseFirestore.instance.collection("users");

              studentRef.add({
                'id': idController.text,
                'name': nameController.text,
                'course': courseController.text
              });
            },
            child: Text("add the student "))
      ]),
    );
  }
}
