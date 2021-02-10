import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_details_state.freezed.dart';

@freezed
abstract class CourseDetailsState with _$CourseDetailsState {
  const factory CourseDetailsState({
    @required String name,
    @required double rating,
    @required double price,
    @required bool isBought,
    @required String description,
  }) = _CourseDetailsState;
}

extension CourseDetailsDataDisplayMethods on CourseDetailsState {
  String get boughtStatus => isBought ? 'Open' : 'Buy';
}
