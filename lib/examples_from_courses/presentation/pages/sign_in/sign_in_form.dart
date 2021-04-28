import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF2A3B78), Color(0xFF0A063C)],
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SafeArea(
                    bottom: false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/noostar_entry_logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F0F6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
