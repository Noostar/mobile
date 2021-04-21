import 'dart:math';

import 'package:rxdart/subjects.dart';

import 'course_list_events.dart';
import 'course_list_state.dart';

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
    if (event is DataRequested) {
      final newItems = <String>[];
      final prevState = _stateController.value;
      newItems.addAll([
        ...prevState.courseItems,
        ..._newCourseItems(),
      ]);

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

  List<String> _newCourseItems() {
    final lastIndex = _currentPage * _itemsPerPage + 1;
    final list = <String>[];
    final itemsToDownloadCount =
        min(_itemsPerPage, _finalCount - _currentPage * _itemsPerPage);
    for (var i = lastIndex; i < lastIndex + itemsToDownloadCount; i++) {
      list.add('Course ${i}');
    }

    return list;
  }

  void dispose() {
    _stateController.close();
  }
}
