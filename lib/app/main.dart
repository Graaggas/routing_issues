import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:route_issue/app/di.dart';

import '../route/app_coordinate.dart';
import '../route/coordinator.dart';
import '../route/my_route_delegate.dart';
import '../route/my_route_info_parser.dart';

const _localizations = [Locale('en', 'PK')];
const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Coordinator coordinator;

  @override
  void initState() {
    coordinator = context.read(coordinatorProvider);
    _setupRouting(coordinator);

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const CupertinoScrollBehavior(),

      /// Localization
      locale: _localizations.first,
      localizationsDelegates: _localizationsDelegates,
      localeResolutionCallback: (locale, supportedLocales) {
        Intl.defaultLocale = locale?.toString();

        return locale;
      },
      supportedLocales: _localizations,

      /// Related to Navigator 2.0
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(coordinator),
    );
  }

  void _setupRouting(Coordinator coordinator) {
    coordinator
      ..initialCoordinate = AppCoordinate.initial
      ..registerCoordinates('/app/', appCoordinates);
  }
}
