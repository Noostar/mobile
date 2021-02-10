import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_details_events.freezed.dart';

@freezed
abstract class CourseDetailsEvent with _$CourseDetailsEvent {
  const factory CourseDetailsEvent.buy() = _Buy;
  const factory CourseDetailsEvent.open() = _Open;
}
