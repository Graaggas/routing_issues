import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../route/coordinator.dart';

final coordinatorProvider = ChangeNotifierProvider((_) => Coordinator());
