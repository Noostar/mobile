import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_events.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_state.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_bloc.dart';
import 'package:provider/provider.dart';

class CourseListData {
  List<String> courseItems;
  bool isLoading;
  bool hasMore;

  CourseListData({
    @required this.courseItems,
    @required this.isLoading,
    @required this.hasMore,
  });
}

class CourseListPage extends StatelessWidget {
  final CourseListData inputData;

  const CourseListPage(this.inputData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider.value(
        value: inputData,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Active Courses'),
          ),
          body: BlocProvider<CourseListBloc>(
            create: (context) => CourseListBloc(inputData),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14),
                  const Text(
                    'Active courses',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: const [
                      Text('Recommended couses'),
                      SizedBox(width: 31),
                      Text('Available couses'),
                    ],
                  ),
                  const SizedBox(height: 21),
                  const Expanded(
                    child: _CourseList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _CourseList extends StatelessWidget {
  const _CourseList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseListBloc, CourseListState>(
      builder: (context, state) {
        var itemCount = 0;
        if (state != null) {
          if (state.hasMore) {
            itemCount = state.courseItems.length + 1;
          } else {
            itemCount = state.courseItems.length;
          }
        }

        return GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= state.courseItems.length) {
              if (!state.isLoading) {
                context
                    .read<CourseListBloc>()
                    .add(const CourseListEvent.loadMore());
              }
              return const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return _CourseListItem(
              title: state.courseItems[index],
              progress: Percent(100),
            );
          },
          itemCount: itemCount,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 21,
            mainAxisSpacing: 22,
          ),
          padding: const EdgeInsets.only(
            bottom: 75,
          ),
        );
      },
    );
  }
}

class _CourseListItem extends StatelessWidget {
  final String title;
  final Percent progress;
  const _CourseListItem({Key key, this.title, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Container(
              color: const Color(0xFFC4C4C4),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(
                bottom: 15,
                left: 6,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            Container(
              height: 11,
              width: double.infinity,
              color: const Color(0xFF81c54b),
              child: Text(
                progress.getPercent(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      );
}

class Percent {
  final double value;
  Percent(this.value);

  String getPercent() =>
      value == value.round() ? '${value.round()}%' : '${value}%';
}
