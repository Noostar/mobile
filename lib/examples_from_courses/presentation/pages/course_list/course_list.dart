import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_events.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Active Courses'),
          ),
          body: Padding(
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
      );
}

class _CourseList extends StatelessWidget {
  const _CourseList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = CourseListBloc();

    return StreamBuilder(
      stream: _bloc.stateStream,
      builder: (context, snapshot) {
        var itemCount = 0;
        if (snapshot.data != null) {
          if (snapshot.data.hasMore) {
            itemCount = snapshot.data.courseItems.length + 1;
          } else {
            itemCount = snapshot.data.courseItems.length;
          }
        }

        return GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= snapshot.data.courseItems.length) {
              if (!snapshot.data.isLoading) {
                _bloc.addEvent(GetMoreData());
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
              title: snapshot.data.courseItems[index],
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
