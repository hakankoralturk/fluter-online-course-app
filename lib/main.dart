import 'package:flutter/material.dart';
import 'package:online_course_app/ui/screens/main_screen.dart';
import 'package:online_course_app/ui/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: appBgColor,
        primaryColor: primary,
      ),
      home: const MainScreen(),
    );
  }
}
