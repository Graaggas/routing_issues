import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'coordinator.dart';

final coordinatorProvider = ChangeNotifierProvider((_) => Coordinator());
