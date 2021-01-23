import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RecoveryPassword(),
      );
}

class RecoveryPassword extends StatelessWidget {
  const RecoveryPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width *
                      0.13), // * 13% Padding of the screen
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '''
Password
recovery:''',
                            style: TextStyle(fontSize: 40),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Opacity(
                              opacity: 0.6,
                              child: Text(
                                'Back',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Email:',
                      style: TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                        decoration: InputDecoration(
                            hintText: 'Write your email here',
                            fillColor: Color(0xffC4C4C4))),
                    const SizedBox(
                      height: 60,
                    ),
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
                  ]),
            ),
          ),
        ),
      );
}
