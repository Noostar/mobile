import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/presentation/widgets/app_bar_content.dart';
import 'package:provider/provider.dart';

class CourseDetailsData {
  final String name;
  final double rating;
  final double price;
  bool isBought;
  final String description;

  CourseDetailsData({
    @required this.name,
    @required this.rating,
    @required this.price,
    @required this.isBought,
    @required this.description,
  });
}

extension CourseDetailsDataDisplayMethods on CourseDetailsData {
  String get boughtStatus => isBought ? 'Open' : 'Buy';
}

class CourseDetails extends StatelessWidget {
  final CourseDetailsData inputData;

  const CourseDetails(this.inputData, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider.value(
        value: inputData,
        child: Scaffold(
          // appBar: AppBar(
          //   title: const NoostarAppBarContent(),
          // ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Course title',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: const Color(0xffC4C4C4),
                ),
                const SizedBox(height: 8),
                const Expanded(
                  child: SingleChildScrollView(
                    child: _CourseDescription(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _CourseDescription extends StatelessWidget {
  const _CourseDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Rating: 4.83'),
              Text('Price: 10\$'),
              _BuyButton(),
            ],
          ),
          const SizedBox(height: 8),
          const Text('''Duration: 10 hrs.
          
Authors: Author1, Author2 ...

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...

Start skills:
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...

Final skills:
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua...
''')
        ],
      );
}

class _BuyButton extends StatefulWidget {
  const _BuyButton({
    Key key,
  }) : super(key: key);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<_BuyButton> {
  @override
  Widget build(BuildContext context) {
    final courseData = Provider.of<CourseDetailsData>(context, listen: false);

    return GestureDetector(
      onTap: () {
        setState(() {
          // Inversion
          courseData.isBought = !courseData.isBought;
        });
      },
      child: Container(
        width: 125,
        height: 28,
        alignment: Alignment.center,
        color: const Color(0xff71FF98),
        child: Text(courseData.boughtStatus),
      ),
    );
  }
}
