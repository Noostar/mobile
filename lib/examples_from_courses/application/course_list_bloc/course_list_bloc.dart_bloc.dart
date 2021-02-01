import 'dart:math';

import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_state.dart';
import 'package:rxdart/subjects.dart';

import 'course_list_events.dart';

class CourseListBloc {
  final _stateController =
      BehaviorSubject<CourseListState>.seeded(CourseListState.initial());
  final _finalCount = 60;
  final _itemsPerPage = 20;
  int _currentPage = 0;
  bool _hasMore = true;

  Stream<CourseListState> get stateStream => _stateController.stream;

  void addEvent(CourseListEvent event) => _mapEventToState(event);

  void _mapEventToState(CourseListEvent event) async {
    if (event is GetMoreData) {
      List<String> newItems = [];
      final prevState = _stateController.value;
      final items = newCourseItems(prevState.courseItems.length);

      newItems.addAll(prevState.courseItems);
      // ignore: cascade_invocations
      newItems.addAll(items);

      if (newItems.length == _finalCount) {
        _hasMore = false;
      }
      _stateController.add(prevState.copyWith(isLoading: true));
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          _stateController.add(
            prevState.copyWith(
              isLoading: false,
              courseItems: newItems,
              hasMore: _hasMore,
            ),
          );
          _currentPage++;
        },
      );
    }
  }

  List<String> newCourseItems(int lastIndex) {
    final list = <String>[];
    final n = min(_itemsPerPage, _finalCount - _currentPage * _itemsPerPage);
    for (var i = lastIndex; i < lastIndex + n; i++) {
      list.add('Course ${i + 1}');
    }
    return list;
  }

  void dispose() {
    _stateController.close();
  }
}
