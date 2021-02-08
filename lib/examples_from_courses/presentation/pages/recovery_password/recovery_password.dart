import 'package:flutter/material.dart';
import 'bloc.dart';

class RecoveryPassword extends StatefulWidget {
  const RecoveryPassword({Key key}) : super(key: key);

  @override
  _RecoveryPasswordState createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
  final _block = RecoveryPasswordBloc();

  @override
  void initState() {
    super.initState();

    _block.stateStream.listen(
      (value) {
        if (value.isSumbitted) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Ok');
                  },
                  child: const Text('Ok'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: const Text('Cancel'),
                )
              ],
              content: Text('You typed: ${value.email}'),
            ),
          ).then(print);
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
                    decoration: const InputDecoration(
                      hintText: 'Write your email here',
                      fillColor: Color(0xffC4C4C4),
                    ),
                    onChanged: (val) {
                      _block.add(email: val);
                    },
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

  @override
  void dispose() {
    _block.dispose();
    super.dispose();
  }
}
