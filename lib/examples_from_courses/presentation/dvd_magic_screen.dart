import 'package:flutter/material.dart';

class DvdMagicScreen extends StatelessWidget {
  const DvdMagicScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: const AnimationDVD(),
        ),
      ),
    );
  }
}

class AnimationDVD extends StatefulWidget {
  const AnimationDVD({Key key}) : super(key: key);

  @override
  _AnimationDvdState createState() => _AnimationDvdState();
}

class _AnimationDvdState extends State<AnimationDVD> {
  double top = 0;
  double left = 0;
  double right = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    print('On tap. Prev screenWidth = $screenWidth, next screenHeight = $screenHeight');

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: top,
            left: left,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => setState(() => _moveDVD(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'DVD',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'video',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: MaterialButton(
              color: Colors.yellow.withOpacity(0.3),
              onPressed: () => setState(resetValues),
            ),
          )
        ],
      ),
    );
  }

  void _moveDVD(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final newTop = top + 50;
    final newLeft = left + 50;

    print('On tap. Prev top = $top, next top = $newTop');
    print('On tap. Prev left = $left, next left = $newLeft');

    if (newTop < (screenHeight - 50)) {
      top = newTop;
    }
    if (newLeft < (screenWidth - 50)) {
      left = newLeft;
    }
  }

  void resetValues() {
    left = 0;
    top = 0;
  }
}
