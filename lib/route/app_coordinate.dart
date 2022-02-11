import 'package:route_issue/screens/otp_screen/otp_screen.dart';

import 'coordinate.dart';
import '../screens/init_screen/init_screen.dart';

class AppCoordinate implements Coordinate {
  static const initScreen = AppCoordinate._('init_screen');
  static const otpScreen = AppCoordinate._('otp_screen');

  static const initial = otpScreen;

  final String _value;

  const AppCoordinate._(this._value);

  @override
  String toString() => _value;
}

final Map<AppCoordinate, CoordinateBuilder> appCoordinates = {
  AppCoordinate.initScreen: (_, __) => const InitScreen(),
  AppCoordinate.otpScreen: (_, __) => OtpScreen(),
};
