import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/course_list/course_list.dart';
import 'package:mobile/theme.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = NoostarBlocObserver();
  runApp(const NoostarApp());
}

class NoostarApp extends StatelessWidget {
  const NoostarApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Noostar',
        theme: noostarTheme,
        home: const CourseListPage(),
      );
}
