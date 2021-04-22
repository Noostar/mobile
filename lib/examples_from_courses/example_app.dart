import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_details/course_detaills.dart';
import 'package:mobile/examples_from_courses/presentation/pages/sign_in/sign_in_form.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInPage(),
      );
}
