import 'package:big_json/View/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(jsonDataSource());
}

class jsonDataSource extends StatefulWidget {
  const jsonDataSource({super.key});

  @override
  State<jsonDataSource> createState() => _jsonDataSourceState();
}

class _jsonDataSourceState extends State<jsonDataSource> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
