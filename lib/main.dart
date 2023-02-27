import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_api_kullanmayi_ogreniyorum/karisikVeri/kisiler.dart';
import 'package:web_api_kullanmayi_ogreniyorum/karisikVeri/kisilerCevap.dart';

import 'karisikVeri/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
