import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: causeError(),
          builder: (context, snapshot) => Container(),
        ),
      ),
    );
  }
}

Future causeError() async {
  try {
    return await get('https://abc.example.com');
  } on SocketException catch (e) {
    print('Caught SocketException: $e');
  } catch (e) {
    print('Caught error: $e');
  }
}
