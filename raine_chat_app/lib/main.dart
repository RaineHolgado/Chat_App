import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:raine_chat_app/app/locator.dart';
import 'package:raine_chat_app/screens/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            color: Colors.white,
            textTheme: TextTheme(
              headline6: TextStyle(
                color: Colors.black,
                fontSize: 30,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            )),
        fontFamily: 'Arial',
      ),
      home: WelcomeView(),
    );
  }
}