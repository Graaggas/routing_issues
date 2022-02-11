import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'app_coordinate.dart';
import 'coordinate.dart';

class MyRouteInformationParser extends RouteInformationParser<Coordinate> {
  @override
  Future<Coordinate> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(AppCoordinate.initial);
}
