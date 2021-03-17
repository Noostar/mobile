import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_events.dart';
import 'package:flutter/services.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF1F0F6),
    ));
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85.0),
          child: AppBar(
            brightness: Brightness.light,
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/avatar.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  const Text(
                    'Katherine',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0A063C),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: const Color(0xFFF1F0F6),
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A063C),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: const [
                  Text(
                    'Active',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF5215)),
                  ),
                  SizedBox(width: 31),
                  Text('Recommended'),
                  SizedBox(width: 31),
                  Text('Available'),
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

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index >= snapshot.data.courseItems.length) {
              if (!snapshot.data.isLoading) {
                _bloc.addEvent(GetMoreData());
              }
              return const Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFFF5215)),
                  ),
                ),
              );
            }
            return _CourseListItem(
              title: snapshot.data.courseItems[index],
              progress: Percent(100),
            );
          },
          itemCount: itemCount,
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
        child: Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                Container(
                  height: 224,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/course_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 224,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.center,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                        Color(0x00000000),
                        Color(0xD5000000),
                      ])),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15, bottom: 30),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                  height: 14,
                  width: double.infinity,
                  color: const Color(0xFF239621),
                  child: Text(progress.getPercent(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ],
            ),
          ),
        ),
      );
}

class Percent {
  final double value;
  Percent(this.value);

  String getPercent() =>
      value == value.round() ? '${value.round()}%' : '${value}%';
}
