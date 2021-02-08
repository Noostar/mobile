import 'package:rxdart/rxdart.dart';

class RecoveryPasswordBloc {
  final _inputController = BehaviorSubject<RecoveryPasswordState>.seeded(
    RecoveryPasswordState.initial('', false),
  );
  Stream<RecoveryPasswordState> get stateStream => _inputController.stream;

  void add({String email, bool isSumbitted}) {
    _inputController.add(_inputController.value
        .copyWith(email: email, isSumbitted: isSumbitted));
  }

  void dispose() {
    _inputController.close();
  }
}

class RecoveryPasswordState {
  RecoveryPasswordState(this.email, this.isSumbitted);
  RecoveryPasswordState.initial(this.email, this.isSumbitted);

  final String email;
  final bool isSumbitted;

  RecoveryPasswordState copyWith({String email, bool isSumbitted}) =>
      RecoveryPasswordState(
          email ?? this.email, isSumbitted ?? this.isSumbitted);
}
