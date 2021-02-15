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

// extension CourseDetailsDataDisplayMethods on CourseDetailsState {
//   String get boughtStatus => isLoading ? 'Open' : 'Buy';
// }

// class CourseListState {
//   final List<String> courseItems;
//   final bool isLoading;
//   final bool hasMore;

//   CourseListState({
//     this.courseItems,
//     this.isLoading,
//     this.hasMore,
//   });

//   CourseListState.initial()
//       : this(
//           courseItems: [],
//           isLoading: false,
//           hasMore: true,
//         );
//   CourseListState copyWith({
//     List<String> courseItems,
//     bool isLoading,
//     bool hasMore,
//   }) =>
//       CourseListState(
//         courseItems: courseItems ?? this.courseItems,
//         isLoading: isLoading ?? this.isLoading,
//         hasMore: hasMore ?? this.hasMore,
//       );
// }
