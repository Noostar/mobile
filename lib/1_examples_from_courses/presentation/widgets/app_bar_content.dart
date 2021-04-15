import 'package:flutter/material.dart';

class NoostarAppBarContent extends StatelessWidget {
  const NoostarAppBarContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Color(0xffC4C4C4),
              child: const Center(
                child: Text(
                  'Logo',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10, left: 16),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffC4C4C4), shape: BoxShape.circle),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Avatar',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Username',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      );
}
