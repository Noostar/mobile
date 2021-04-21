import 'package:flutter/material.dart';
import 'package:mobile/theme.dart' as theme;

class NoostarTabBar extends StatelessWidget {
  const NoostarTabBar({
    @required this.tabs,
    Key key,
  }) : super(key: key);

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: theme.separatorGrey,
            ),
            TabBar(
              isScrollable: true,
              indicator: _CircleTabIndicator(
                  color: Theme.of(context).accentColor, radius: 3),
              unselectedLabelColor: theme.grey,
              labelColor: Theme.of(context).accentColor,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              tabs: tabs,
            ),
          ],
        ),
      );
}

class _CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  _CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([Function() onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;

  @override
  void paint(
      Canvas canvas, Offset offset, ImageConfiguration imageConfiguration) {
    final indicatorCenter = offset +
        Offset(
          imageConfiguration.size.width / 2,
          imageConfiguration.size.height,
        );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: indicatorCenter, width: 44, height: 5),
        const Radius.circular(3),
      ),
      _paint,
    );
  }
}
