import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: const Image(
            image: AssetImage('assets/course_image.png'),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 240),
          padding: const EdgeInsets.fromLTRB(20, 29, 20, 120),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Python Crash Course',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          color: Color(0xff0A063C)),
                    ),
                    const Text(
                      '10\$',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF5215)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      '4.9',
                      style: TextStyle(
                          color: Color(0xff8886A9),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(width: 5),
                    const Image(
                      image: AssetImage('assets/star.png'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Duration:',
                      style: TextStyle(
                          color: Color(0xff0A063C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                    const Text(
                      '10 hrs',
                      style: TextStyle(
                          color: Color(0xff8886A9),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Authors:',
                      style: TextStyle(
                          color: Color(0xff0A063C),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat'),
                    ),
                    const Text(
                      'Ivanov I.I., Petrov P.P.',
                      style: TextStyle(
                          color: Color(0xff8886A9),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat'),
                    ),
                  ],
                ),
                const CoursePageInfoBlock(
                    firstBlockText: 'Description:', secondBlockText: '''
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '''),
                const CoursePageInfoBlock(
                    firstBlockText: 'Start skills:', secondBlockText: '''
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua....'''),
                const CoursePageInfoBlock(
                    firstBlockText: 'Final skills:  ', secondBlockText: '''
Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua....''')
              ],
            ),
          ),
        ),
        const BuyButton(),
      ],
    ));
  }
}

class CoursePageInfoBlock extends StatelessWidget {
  final String firstBlockText;
  final String secondBlockText;

  const CoursePageInfoBlock(
      {Key key, this.firstBlockText, this.secondBlockText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstBlockText',
              style: const TextStyle(
                  color: Color(0xff0A063C),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
            ),
            const SizedBox(height: 15),
            Text(
              '$secondBlockText',
              style: const TextStyle(
                  color: Color(0xff8886A9),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat'),
            ),
          ],
        )
      ],
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 62,
        width: 374,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffFF5B15), Color(0xffD0291E)])),
        child: const Center(
            child: Text(
          'Buy course',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
