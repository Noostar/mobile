import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_state.freezed.dart';

@freezed
abstract class RecoveryPasswordState with _$RecoveryPasswordState {
  const factory RecoveryPasswordState(
      {@required String email,
      @required bool isSumbitted}) = _RecoveryPasswordState;
}

extension RecoveryEmailOnSubmit on RecoveryPasswordState {
  String get submitStatus => isSumbitted ? '' : email;
}
