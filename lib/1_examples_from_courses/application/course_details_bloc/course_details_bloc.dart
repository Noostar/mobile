import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mobile/1_examples_from_courses/presentation/pages/course_details/course_detaills.dart';
import 'course_details_events.dart';
import 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc(CourseDetailsData inputData)
      : super(CourseDetailsState(
          description: inputData.description,
          isBought: inputData.isBought,
          name: inputData.name,
          price: inputData.price,
          rating: inputData.rating,
        ));

  @override
  Stream<CourseDetailsState> mapEventToState(CourseDetailsEvent event) async* {
    yield* event.map(
      buy: (e) async* {
        yield state.copyWith(isBought: true);
      },
      open: (e) async* {
        yield state.copyWith(isBought: false);
      },
    );
  }
}
