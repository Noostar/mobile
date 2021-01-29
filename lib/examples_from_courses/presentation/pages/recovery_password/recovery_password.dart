import 'package:flutter/material.dart';
import 'bloc.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({Key key}) : super(key: key);

  @override
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final _emailController = TextEditingController();
  final _block = RecoveryPasswordBloc();

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      _block.add(email: _emailController.text);
    });

    _block.stateStream.listen(
      (value) {
        print(value.email);

        if (value.isSumbitted) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: Text('You typed: ${value.email}'),
            ),
          );

          _block.add(isSumbitted: false);
        }
      },
    );
  }

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
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Write your email here',
                      fillColor: Color(0xffC4C4C4),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      color: const Color(0xff565DFF),
                      onPressed: () {
                        _block.add(isSumbitted: true);
                      },
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
