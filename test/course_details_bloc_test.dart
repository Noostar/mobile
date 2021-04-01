import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/examples_from_courses/application/course_details_bloc/course_details_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_details_bloc/course_details_events.dart';
import 'package:mobile/examples_from_courses/application/course_details_bloc/course_details_state.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_details/course_detaills.dart';

void main() {
  group('CourseDetailsBloc', () {
    final initData = CourseDetailsData(description: '', isBought: false, name: '1', price: 1, rating: 1);

    blocTest(
      'Test CourseDetailsEvent.buy()',
      build: () => CourseDetailsBloc(initData),
      act: (bloc) => bloc.add(CourseDetailsEvent.buy()),
      expect: [
        isA<CourseDetailsState>().having(
          (state) => state.isBought,
          'After buy event isBought variable should be true.',
          true,
        ),
      ],
    );

    blocTest(
      'Test CourseDetailsEvent.open()',
      build: () =>
          CourseDetailsBloc(CourseDetailsData(description: '', isBought: true, name: '1', price: 1, rating: 1)),
      act: (bloc) => bloc.add(CourseDetailsEvent.open()),
      expect: [
        isA<CourseDetailsState>().having(
          (state) => state.isBought,
          'After open event isBought variable should be false.',
          false,
        ),
      ],
    );
  });
}
