import 'package:go_router/go_router.dart';

import '../screens/recycle_bin_screen.dart';
import '../screens/tasks_screen.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      builder: (context, state) => const TasksScreen(),
      name: TasksScreen.name,
      path: TasksScreen.path,
    ),
    GoRoute(
      builder: (context, state) => const RecycleBinScreen(),
      name: RecycleBinScreen.name,
      path: RecycleBinScreen.path,
    ),
  ],
  initialLocation: TasksScreen.path,
);
