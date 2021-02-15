import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_list/course_list.dart';
import 'course_list_events.dart';
import 'course_list_state.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc(CourseListData inputData)
      : super(CourseListState(
          courseItems: inputData.courseItems,
          isLoading: inputData.isLoading,
          hasMore: inputData.hasMore,
        ));

  final _finalCount = 60;
  final _itemsPerPage = 20;
  final int _currentPage = 0;

  @override
  Stream<CourseListState> mapEventToState(CourseListEvent event) async* {
    yield* event.map(
      loadMore: (e) async* {
        yield state.copyWith(isLoading: true);
        await Future.delayed(const Duration(seconds: 3));
        final newItems = [...state.courseItems, ..._newCourseItems()];

        if (newItems.length == _finalCount) {
          yield state.copyWith(hasMore: false);
        }
        yield state.copyWith(isLoading: false, courseItems: newItems);
      },
    );
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
}
