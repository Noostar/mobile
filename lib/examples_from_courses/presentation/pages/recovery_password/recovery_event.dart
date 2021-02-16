import 'package:freezed_annotation/freezed_annotation.dart';

part 'recovery_event.freezed.dart';

@freezed
abstract class RecoveryEvent with _$RecoveryEvent {
  const factory RecoveryEvent.add({@required String email}) = _Add;
  const factory RecoveryEvent.submit() = _Submit;
  const factory RecoveryEvent.reset() = _Reset;
}
