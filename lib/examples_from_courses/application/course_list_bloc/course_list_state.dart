import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_state.freezed.dart';

@freezed
abstract class CourseListState with _$CourseListState {
  const factory CourseListState({
    @required List<String> courseItems,
    @required bool isLoading,
    @required bool hasMore,
  }) = _CourseListState;
}
