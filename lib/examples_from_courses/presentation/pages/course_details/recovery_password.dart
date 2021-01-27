import 'package:flutter/material.dart';

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '''Password
recovery:''',
                        style: TextStyle(fontSize: 40),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Opacity(
                          opacity: 0.6,
                          child: Text(
                            'Back',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Email:',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your email here',
                      fillColor: Color(0xffC4C4C4),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: const Color(0xff565DFF),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(21, 9, 21, 9),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
