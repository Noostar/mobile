import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_state.freezed.dart';

@freezed
abstract class RecoveryPasswordState with _$RecoveryPasswordState {
  const factory RecoveryPasswordState(
      {@required String email,
      @required bool isSubmitted}) = _RecoveryPasswordState;

  factory RecoveryPasswordState.initial() =>
      const RecoveryPasswordState(email: '', isSubmitted: false);
}

extension RecoveryEmailOnSubmit on RecoveryPasswordState {
  String get submitStatus => isSubmitted ? '' : email;
}
