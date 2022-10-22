import 'package:flutter/material.dart';
import 'package:myapp/components/delete.dart';
import '../components/add.dart';
import '../components/read.dart';
import '../components/update.dart';

import '../components/add.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.update)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.read_more)),
            ]),
          ),
          body: TabBarView(children: [
            Add_component(),
            Update_component(),
            Delete_component(),
            Read_component(),
          ])),
    );
  }
}
