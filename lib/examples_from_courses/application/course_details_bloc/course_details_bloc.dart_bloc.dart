import 'dart:async';

import 'package:rxdart/subjects.dart';

import 'course_details_events.dart';
import 'course_details_state.dart';

class CourseDetailsBloc {
  final _stateController = BehaviorSubject<CourseDetailsState>();
  Stream<CourseDetailsState> get stateStream => _stateController.stream;

  void addEvent(CourseDetailsEvent event) => _mapEventToState(event);

  void _mapEventToState(CourseDetailsEvent event) async {
    if (event is CourseDetailsBought) {
      final prevState = _stateController.value;
      _stateController.add(prevState.copyWith(isBought: true));
    }
  }

  void dispose() {
    _stateController.close();
  }
}

// class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
//   CourseDetailsBloc() : super(CourseDetailsState.initial());

//   @override
//   Stream<CourseDetailsState> mapEventToState(CourseDetailsEvent event) {}
//   // CourseDetailsBloc() : super(initialState);

//   // @override
//   // Stream<CourseDetailsBloc.dartState> mapEventToState(
//   //   CourseDetailsBloc.dartEvent event,
//   // ) async* {
//   //   try {
//   //     yield* event.applyAsync(currentState: state, bloc: this);
//   //   } catch (_, stackTrace) {
//   //     developer.log('$_', name: 'CourseDetailsBloc.dartBloc', error: _, stackTrace: stackTrace);
//   //     yield state;
//   //   }
//   // }
// }
