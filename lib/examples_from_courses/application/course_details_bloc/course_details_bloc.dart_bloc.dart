import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_details_bloc/course_details_events.dart';
import 'package:mobile/examples_from_courses/application/course_details_bloc/course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc() : super(CourseDetailsState.initial());

  @override
  Stream<CourseDetailsState> mapEventToState(CourseDetailsEvent event) {}
  // CourseDetailsBloc() : super(initialState);

  // @override
  // Stream<CourseDetailsBloc.dartState> mapEventToState(
  //   CourseDetailsBloc.dartEvent event,
  // ) async* {
  //   try {
  //     yield* event.applyAsync(currentState: state, bloc: this);
  //   } catch (_, stackTrace) {
  //     developer.log('$_', name: 'CourseDetailsBloc.dartBloc', error: _, stackTrace: stackTrace);
  //     yield state;
  //   }
  // }
}
