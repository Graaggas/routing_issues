import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'init_screen_wm.dart';

class InitScreen extends ElementaryWidget<InitScreenWM> {
  const InitScreen({
    Key? key,
    WidgetModelFactory<InitScreenWM> wmFactory = createInitScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(InitScreenWM wm) {
    return const Scaffold(
      body: SizedBox(
        child: Center(
          child: Text('Test'),
        ),
      ),
    );
  }
}
