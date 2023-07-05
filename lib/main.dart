import 'package:flutter/material.dart';
import 'package:putri_movie/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Putri Movie',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 46, 46, 46).withOpacity(0.5)),
      home: const HomePages(),
      
    );
  }
}