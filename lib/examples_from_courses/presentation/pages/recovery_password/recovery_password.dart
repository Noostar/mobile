import 'package:flutter/material.dart';
import 'package:mobile/examples_from_courses/presentation/pages/recovery_password/recovery_event.dart';
import 'package:mobile/examples_from_courses/presentation/pages/recovery_password/recovery_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class RecoveryPassword extends StatelessWidget {
  final _block = RecoveryPasswordBloc(
      const RecoveryPasswordState(email: '', isSumbitted: false));

  @override
  Widget build(BuildContext context) => BlocProvider<RecoveryPasswordBloc>(
        create: (context) => _block,
        child: Scaffold(
          body: Builder(
            builder: (context) =>
                BlocListener<RecoveryPasswordBloc, RecoveryPasswordState>(
              listener: (context, state) {
                if (state.isSumbitted == true) {
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
                      content: Text('You typed: ${state.email}'),
                    ),
                  ).then(print);
                  _block.add(const RecoveryEvent.reset());
                }
              },
              child: Container(
                child: SafeArea(
                  child: Padding(
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
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
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
                            _block.add(RecoveryEvent.add(email: val));
                          },
                        ),
                        const SizedBox(height: 60),
                        Align(
                          alignment: Alignment.center,
                          child: RaisedButton(
                            color: const Color(0xff565DFF),
                            onPressed: () {
                              _block.add(const RecoveryEvent.submit());
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(21, 9, 21, 9),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
