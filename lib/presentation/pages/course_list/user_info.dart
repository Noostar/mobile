import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 25,
            left: 20,
            right: 20,
          ),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/avatar.png'),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 13),
              Text(
                'Katherine',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      );
}
