import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 11,
        crossAxisCount: 2,
        padding: const EdgeInsets.only(
          bottom: 75,
        ),
        children: List.generate(
          6,
          (index) => _CourseListItem(
            title: 'Course $index',
            progress: const Percent(value: 100),
          ),
        ),
      );
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
              height: 167,
              width: 167,
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
              width: 167,
              color: const Color(0xFF81c54b),
              child: progress,
            ),
          ],
        ),
      );
}

class Percent extends StatelessWidget {
  final int value;
  const Percent({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        '$value%',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 10),
      );
}
