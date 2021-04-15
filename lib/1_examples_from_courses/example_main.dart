import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/1_examples_from_courses/example_app.dart';

import '../bloc_observer.dart';

void main() {
  Bloc.observer = NoostarBlocObserver();
  runApp(ExampleApp());
}
