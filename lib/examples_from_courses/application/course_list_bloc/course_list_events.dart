import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_events.freezed.dart';

@freezed
abstract class CourseListEvent with _$CourseListEvent {
  const factory CourseListEvent.loadMore() = _Load;
}
