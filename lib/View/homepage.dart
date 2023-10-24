import 'dart:convert';
import 'package:big_json/Model/jsonfile.dart';
import 'package:big_json/Provider/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Model/on.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Employe? employe;
  On? on;
  int Counter = 0;

  @override
  void initState() {
    Counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.javascript_sharp,
            size: 50,
          )
        ],
        title: Text('Json_Parsing'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text("${employe?.firstName}"),
            // Text("${employe?.lastName}"),
            // Text("${employe?.phoneNumbers}"),
            // Text("${employe?.address}"),
            // Text("${employe?.age}"),
            // Text("${employe?.gender}"),
            Text("${on?.name}"),
            Column(
              children: employe?.phoneNumbers?.map((e) {
                    return Text("${e.type} = ${e.number}");
                  }).toList() ??
                  [],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var loadString = await rootBundle.loadString("assets/one.json");
          var loadString2 = await rootBundle.loadString("assets/on.json");
          var map = jsonDecode(loadString);
          var map2 = jsonDecode(loadString2);
          employe = Employe.fromJson(map);
          on = On.fromJson(map2);
          print(loadString);
          setState(() {});
          increment();
          print(Counter);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Pages();
            },
          ));
        },
      ),
    );
  }

  void increment() {
    Counter++;
    setState(() {
      Counter;
    });
  }
}
