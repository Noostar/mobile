import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_events.dart';
import 'package:flutter/services.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF1F0F6),
        statusBarBrightness: Brightness.light,
      ),
    );
    final tabs = {
      const Tab(text: 'Active'): const _CourseList(),
      const Tab(text: 'Recomended'): const _CourseList(),
      const Tab(text: 'Available'): const _CourseList(),
    };
    return DefaultTabController(
      length: tabs.keys.length,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfo(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A063C),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              CourseTabs(tabs: tabs),
              const SizedBox(height: 21),
              Expanded(
                child: TabBarView(children: tabs.values.toList()),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (BuildContext context, int index) {
            if (index >= snapshot.data.courseItems.length) {
              if (!snapshot.data.isLoading) {
                _bloc.addEvent(GetMoreData());
              }
              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFFF5215)),
                    ),
                  ),
                ),
              );
            }
            return _CourseListItem(
              title: snapshot.data.courseItems[index],
              progress: Percent(75),
            );
          },
          itemCount: itemCount,
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
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    bottom: 30,
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF5215),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ],
                  ),
                ),
                CourseProgressBar(progress: progress),
              ],
            ),
          ),
        ),
      );
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 25,
            left: 20,
            right: 20,
          ),
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
                  shape: BoxShape.circle,
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
      );
}

class CourseTabs extends StatelessWidget {
  final Map tabs;
  const CourseTabs({Key key, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 0,
            bottom: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: const Color(0xFFD7D6E4),
            ),
          ),
          TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5,
            indicatorColor: Color(0xFFFF5215),
            unselectedLabelColor: Color(0xFF8886A9),
            labelColor: Color(0xFFFF5215),
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            tabs: tabs.keys.toList(),
          ),
        ],
      ),
    );
  }
}

class CourseProgressBar extends StatelessWidget {
  final Percent progress;
  const CourseProgressBar({Key key, this.progress}) : super(key: key);

  Color getColor(Percent progress) {
    if (progress.getValue() <= 33) {
      return const Color(0xFFF2C94C);
    } else if (progress.getValue() > 33 && progress.getValue() <= 66) {
      return const Color(0xFFB1D64B);
    } else if (progress.getValue() > 66) {
      return const Color(0xFF239621);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        child: Stack(
          children: [
            Container(
              height: 14,
              width: double.infinity,
              color: const Color(0x59626262),
            ),
            Container(
              height: 14,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress.getValue() * 0.01,
                child: Container(
                  width: 140,
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: (progress.getValue() != 100)
                        ? const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )
                        : null,
                    color: getColor(progress),
                  ),
                ),
              ),
            ),
            Container(
              height: 14,
              width: double.infinity,
              child: Text(
                progress.getPercent(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
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
  double getValue() => value;
}
