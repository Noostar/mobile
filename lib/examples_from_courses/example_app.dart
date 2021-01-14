import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_details/course_detaills.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CourseDetails(
          CourseDetailsData(
            description: 'Desc',
            isBought: false,
            name: 'Course 1',
            price: 12.23,
            rating: 4.83,
          ),
        ),
      );
}
