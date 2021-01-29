import 'package:rxdart/rxdart.dart';

class RecoveryPasswordBloc {
  final _inputController = BehaviorSubject<RecoveryPasswordState>();
  Stream<RecoveryPasswordState> get stateStream => _inputController.stream;

  void add({String email, bool isSumbitted}) {
    if (_inputController.value == null)
      _inputController.add(RecoveryPasswordState(email, false));
    else
      _inputController.add(_inputController.value
          .copyWith(email: email, isSumbitted: isSumbitted));
  }

  void dispose() {
    _inputController.close();
  }
}

class RecoveryPasswordState {
  RecoveryPasswordState(this.email, this.isSumbitted);

  final String email;
  final bool isSumbitted;

  RecoveryPasswordState copyWith({String email, bool isSumbitted}) =>
      RecoveryPasswordState(
          email ?? this.email, isSumbitted ?? this.isSumbitted);
}
