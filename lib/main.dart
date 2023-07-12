import 'package:flutter/material.dart';
import 'package:putri_movie/ui/account.dart';
import 'package:putri_movie/ui/beranda.dart';
import 'package:putri_movie/ui/favorite.dart';
import 'package:putri_movie/ui/home.dart';
import 'package:putri_movie/ui/insert.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 46, 46, 46).withOpacity(0.5)),
      routes: {
        "/": (context) => const HomePages(),
        "/beranda": (context) => const BerandaPages(),
        "/account": (context) => const AccountPages(),
        "/favorite": (context) => const FavoritePages(),
        "/insert": (context) => const InsertMovie(),
      }
    );
  }
}