import 'package:flutter/material.dart';
import 'package:mobile/application/course_list_bloc/course_list_bloc.dart_bloc.dart';
import 'package:flutter/services.dart';
import 'package:mobile/application/course_list_bloc/course_list_events.dart';
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
    return DefaultTabController(
      length: tabs.keys.length,
      child: Scaffold(
        body: SafeArea(
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
          itemCount = snapshot.data.hasMore ? snapshot.data.courseItems.length + 1 : snapshot.data.courseItems.length;
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (BuildContext context, int index) {
            if (index >= snapshot.data.courseItems.length) {
              if (!snapshot.data.isLoading) {
                _bloc.addEvent(GetMoreData());
              }

              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor,
                      ),
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
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Color(0x00000000), Color(0xD5000000)],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 30, right: 15),
                  child: Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(width: 8),
                      Container(
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
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

class CourseTabs extends StatelessWidget {
  final Map tabs;
  const CourseTabs({Key key, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
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
              indicator: CircleTabIndicator(color: Theme.of(context).accentColor, radius: 3),
              unselectedLabelColor: const Color(0xFF8886A9),
              labelColor: Theme.of(context).accentColor,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              tabs: tabs.keys.toList(),
            ),
          ],
        ),
      );
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius}) : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([Function() onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration imageConfiguration) {
    const marginForPlacingIndicatorOnTheLine = 2.5;

    final circleOffset = offset +
        Offset(
          imageConfiguration.size.width / 2,
          imageConfiguration.size.height - marginForPlacingIndicatorOnTheLine,
        );
    canvas.drawCircle(circleOffset, radius, _paint);
  }
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
              color: const Color(0x59626262),
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

  String get percentValue => value == value.round() ? '${value.round()}%' : '${value}%';

  double get valueFromZeroToOne => value * 0.01;
}

extension PercentView on Percent {
  Color get progressColor {
    if (value <= 33) {
      return const Color(0xFFF2C94C);
    } else if (value > 33 && value <= 66) {
      return const Color(0xFFB1D64B);
    } else {
      return theme.darkGreen;
    }
  }
}
