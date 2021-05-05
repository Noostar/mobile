import 'package:flutter/material.dart';
import 'package:mobile/application/course_list_bloc/course_list_bloc.dart';
import 'package:flutter/services.dart';
import 'package:mobile/application/course_list_bloc/course_list_events.dart';
import 'package:mobile/presentation/pages/course_list/user_info.dart';
import 'package:mobile/presentation/widgets/tab_bar.dart';
import 'package:mobile/theme.dart' as theme;

import 'course_item.dart';
import 'percent.dart';

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

        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
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

            return CourseListItem(
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
