import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cat-Human-Dog Identifier",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}