import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:route_issue/app_coordinate.dart';
import 'package:route_issue/coordinator.dart';
import 'package:route_issue/di.dart';
import 'package:route_issue/init_screen_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'init_screen.dart';

class InitScreenWM extends WidgetModel<InitScreen, InitScreenModel> {
  final BuildContext _context;

  final Coordinator _coordinator;

  InitScreenWM(
    this._context,
    this._coordinator,
  ) : super(InitScreenModel());

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _coordinator.navigate(_context, AppCoordinate.otpScreen);
  }
}

InitScreenWM createInitScreenWM(BuildContext context) {
  return InitScreenWM(
    context,
    context.read(coordinatorProvider),
  );
}
