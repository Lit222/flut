import 'package:flutter/material.dart';
import 'package:dartapp/pages/mainscreen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.purple,
  ),
  initialRoute: '/',
  routes: {
    '/':(context) => MainScreen(),
  },
));
