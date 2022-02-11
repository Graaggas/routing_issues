import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:route_issue/app/di.dart';
import '../../route/app_coordinate.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    final _coordinator = context.read(coordinatorProvider);
    _coordinator.navigate(context, AppCoordinate.otpScreen);
    return Container();
  }
}
