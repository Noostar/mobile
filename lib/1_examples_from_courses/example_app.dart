import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/course_list/course_list.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: const Color(0xFFF1F0F6),
          primaryColor: const Color(0xFF0A063C),
          accentColor: const Color(0xFFFF5215),
          textTheme: const TextTheme(
            headline4: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A063C),
            ),
            headline6: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A063C),
            ),
            subtitle1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF),
            ),
            bodyText2: TextStyle(
              fontSize: 16.0,
              height: 1.37,
              color: Color(0xFF0A063C),
            ),
            button: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF),
            ),
            caption: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
        home: const CourseListPage(),
      );
}
