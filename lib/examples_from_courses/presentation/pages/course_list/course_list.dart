import 'package:flutter/material.dart';

const List<String> courses = [
  'Course 1',
  'Course 2',
  'Course 3',
  'Course 4',
  'Course 5',
  'Course 6'
];

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
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: 75,
                    ),
                    child: _CourseList(),
                  ),
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
  Widget build(BuildContext context) => Wrap(
        runSpacing: 21,
        spacing: 22,
        children: <Widget>[
          for (final course in courses)
            Stack(
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
                    course,
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
                  child: const Text(
                    '100%',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            )
        ],
      );
}
