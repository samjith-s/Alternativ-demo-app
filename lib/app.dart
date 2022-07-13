import 'package:demo/presentation/pages/home/home_screen.dart';
import 'package:demo/presentation/pages/login/user_login_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserLoginScreen(),
      routes: {
        'home':(context) => HomeScreen(),
      },
    );
  }
}
