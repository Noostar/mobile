import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/examples_from_courses/presentation/dvd_magic_screen.dart';
import 'package:mobile/examples_from_courses/presentation/pages/course_details/course_detaills.dart';
import 'package:provider/provider.dart';

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const DvdMagicScreen(),
    );
  }
}

class _PageContent extends StatefulWidget {
  const _PageContent({
    Key key,
  }) : super(key: key);

  @override
  __PageContentState createState() => __PageContentState();
}

class __PageContentState extends State<_PageContent> {
  double fontSize;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                BlocBuilder<SignInCubit, SignInState>(
                  buildWhen: (prev, curr) => prev.isLoading && !curr.isLoading,
                  builder: (context, state) {
                    fontSize = fontSize == 30 ? 60 : 30;
                    return AnimatedDefaultTextStyle(
                      curve: Curves.slowMiddle,
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(fontSize: fontSize, color: Colors.black),
                      child: const Text('Text'),
                    );
                  },
                ),
                const Spacer(),
                BlocBuilder<SignInCubit, SignInState>(builder: (context, state) {
                  const duration = Duration(seconds: 1);

                  return AnimatedContainer(
                    duration: duration,
                    width: MediaQuery.of(context).size.width,
                    alignment: state.isLoading ? Alignment.centerLeft : Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: duration,
                      height: state.isLoading ? 200 : 100,
                      width: state.isLoading ? 200 : 100,
                      color: state.isLoading ? Colors.pink : Colors.green,
                    ),
                  );
                }),
                const Spacer(),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: MaterialButton(
                      color: Colors.yellow,
                      disabledColor: Colors.yellow,
                      onPressed: state.isLoading ? null : context.read<SignInCubit>().signIn,
                      child: state.isLoading ? const CircularProgressIndicator() : const Text('Press'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState(null, false));

  void signIn() async {
    emit(SignInState(null, true));
    final result = await getCredentials();
    emit(SignInState(result, false));
  }
}

class SignInState {
  final dynamic results;
  final bool isLoading;

  SignInState(this.results, this.isLoading);
}

Future<bool> getCredentials() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}

// Домашка. В чем разница между dynamic и Object
