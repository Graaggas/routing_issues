// ignore_for_file: prefer_mixin

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'coordinate.dart';
import 'coordinator.dart';

class MyRouterDelegate extends RouterDelegate<Coordinate>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Coordinate> {
  final Coordinator coordinator;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate(this.coordinator)
      : navigatorKey = GlobalKey<NavigatorState>() {
    coordinator.addListener(notifyListeners);
  }

  @override
  void dispose() {
    coordinator.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: coordinator.pages,
      // ignore: avoid_types_on_closure_parameters
      onPopPage: (route, Object? result) {
        if (!route.didPop(result)) {
          return false;
        } else {
          coordinator.pop();

          return true;
        }
      },
    );
  }

  /// Called by the Router when the Router.routeInformationProvider
  /// reports that a new route has been pushed to the application by the operating system.
  @override
  Future<void> setNewRoutePath(Coordinate configuration) async =>
      SynchronousFuture(null);
}
