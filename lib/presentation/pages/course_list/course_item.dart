import 'package:flutter/material.dart';
import 'package:mobile/theme.dart' as theme;
import 'percent.dart';

class CourseListItem extends StatelessWidget {
  final String title;
  final Percent progress;
  const CourseListItem({Key key, this.title, this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            CourseBackgroundImage(),
            Blackout(),
            Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 30,
                right: 15,
              ),
              child: CourseTitleRow(title: title),
            ),
            CourseProgressBar(progress: progress),
          ],
        ),
      );
}

class CourseBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Image.asset('assets/course_image.jpg', fit: BoxFit.cover);
}

class Blackout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 224,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [theme.transparentBlack, theme.halfTransparentBlack],
        ),
      ),
    );
  }
}

class CourseTitleRow extends StatelessWidget {
  final String title;
  const CourseTitleRow({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) => Row(
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
