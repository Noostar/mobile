import 'dart:ui';
import 'package:mobile/theme.dart' as theme;

class Percent {
  final double value;
  Percent(this.value);

  String get percentValue =>
      value == value.round() ? '${value.round()}%' : '${value}%';

  double get valueFromZeroToOne => value * 0.01;
}

extension PercentView on Percent {
  Color get progressColor {
    if (value <= 33) {
      return theme.yellow;
    } else if (value > 33 && value <= 66) {
      return theme.lightGreen;
    } else {
      return theme.darkGreen;
    }
  }
}
