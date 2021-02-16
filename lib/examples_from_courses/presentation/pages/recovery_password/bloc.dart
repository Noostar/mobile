import 'package:bloc/bloc.dart';
import 'package:mobile/examples_from_courses/presentation/pages/recovery_password/recovery_event.dart';
import 'package:mobile/examples_from_courses/presentation/pages/recovery_password/recovery_state.dart';

class RecoveryPasswordBloc extends Bloc<RecoveryEvent, RecoveryPasswordState> {
  RecoveryPasswordBloc() : super(RecoveryPasswordState.initial());

  @override
  Stream<RecoveryPasswordState> mapEventToState(RecoveryEvent event) async* {
    yield* event.map(add: (e) async* {
      print('Email: ${e.email} was written');
      yield state.copyWith(email: e.email);
    }, reset: (_) async* {
      print('Form has been reseted');
      yield state.copyWith(isSubmitted: false);
    }, submit: (_) async* {
      print('Form submitted');
      yield state.copyWith(isSubmitted: true);
    });
  }
}
