import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Delete_component extends StatelessWidget {
  const Delete_component({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 50,
        child: ElevatedButton(
            onPressed: () async {
              final usercollection =
                  FirebaseFirestore.instance.collection("users");
              final docRef = usercollection.doc("Nf5m29iJjPwcllNnLdAB");

              docRef.delete();
            },
            child: Text("delet")),
      ),
    );
  }
}
