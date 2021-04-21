import 'package:flutter/material.dart';
import 'package:mobile/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:flutter/services.dart';
import 'package:mobile/application/course_list_bloc/course_list_events.dart';
import 'package:mobile/presentation/widgets/tab_bar.dart';
import 'package:mobile/theme.dart' as theme;

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    final tabs = {
      const Tab(text: 'Active'): const _CourseList(),
      const Tab(text: 'Recomended'): const _CourseList(),
      const Tab(text: 'Available'): const _CourseList(),
    };
    return Scaffold(
      body: DefaultTabController(
        length: tabs.keys.length,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Courses',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const SizedBox(height: 14),
              NoostarTabBar(tabs: tabs.keys.toList()),
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
          itemCount = snapshot.data.hasMore
              ? snapshot.data.courseItems.length + 1
              : snapshot.data.courseItems.length;
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (BuildContext context, int index) {
            if (index >= snapshot.data.courseItems.length) {
              if (!snapshot.data.isLoading) {
                _bloc.addEvent(DataRequested());
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
                    child: CircularProgressIndicator(),
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
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        theme.transparentBlack,
                        theme.halfTransparentBlack
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 30, right: 15),
                  child: Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(width: 8),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
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
              Text(
                'Katherine',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      );
}

class CourseProgressBar extends StatelessWidget {
  final Percent progress;
  const CourseProgressBar({Key key, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Stack(
          children: [
            Container(
              height: 14,
              width: double.infinity,
              color: theme.halfTransparentGrey,
            ),
            Container(
              height: 14,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: progress.valueFromZeroToOne,
                child: Container(
                  width: 140,
                  height: 14,
                  decoration: BoxDecoration(
                    borderRadius: (progress.value != 100)
                        ? const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )
                        : null,
                    color: progress.progressColor,
                  ),
                ),
              ),
            ),
            Container(
              height: 14,
              width: double.infinity,
              child: Text(
                progress.percentValue,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      );
}

class Percent {
  final double value;
  Percent(this.value);

  String get percentValue =>
      value == value.round() ? '${value.round()}%' : '${value}%';

  double get valueFromZeroToOne => value * 0.01;
}

extension PercentView on Percent {
  Color get progressColor {
    if (value <= 33) {
      return theme.yellow;
    } else if (value > 33 && value <= 66) {
      return theme.lightGreen;
    } else {
      return theme.darkGreen;
    }
  }
}
