import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:mobile/examples_from_courses/application/course_list_bloc/course_list_events.dart';
import 'package:flutter/services.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF1F0F6),
    ));
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85.0),
          child: AppBar(
            titleSpacing: 0,
            brightness: Brightness.light,
            backgroundColor: const Color(0xFFF1F0F6),
            title: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
            elevation: 0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Courses',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A063C),
                ),
              ),
              const SizedBox(height: 14),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFD7D6E4),
                    margin: const EdgeInsets.only(bottom: 2),
                  ),
                  const TabBar(
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
                    tabs: [
                      Tab(
                        text: 'Active',
                      ),
                      Tab(
                        text: 'Recommended',
                      ),
                      Tab(
                        text: 'Available',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 21),
              const Expanded(
                child: TabBarView(children: [
                  _CourseList(),
                  _CourseList(),
                  _CourseList(),
                ]),
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
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20,
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
                Stack(
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
                            color: (() {
                              if (progress.getValue() <= 33)
                                return const Color(0xFFF2C94C);
                              else if (progress.getValue() > 33 &&
                                  progress.getValue() <= 66)
                                return const Color(0xFFB1D64B);
                              else if (progress.getValue() > 66)
                                return const Color(0xFF239621);
                            })(),
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
  double getValue() => value;
}
