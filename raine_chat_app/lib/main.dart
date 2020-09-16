import 'package:flutter/material.dart';
import 'package:raine_chat_app/screens/welcome_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
        ) 
      ),
      home: WelcomeView(),
    );
  }
}