import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_list/course_list.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: const Color(0xFFF1F0F6),
        ),
        home: CourseListPage(),
      );
}
