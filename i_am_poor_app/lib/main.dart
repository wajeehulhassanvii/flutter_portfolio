import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade100,
        title: Text('I am Poor App'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/broke-man-cartoon.jpg')
        ),
      ),
    ),
  ));
}
