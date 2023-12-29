import 'package:go_router/go_router.dart';

import '../screens/screens.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      builder: (context, state) => const TabsScreen(),
      name: TabsScreen.name,
      path: TabsScreen.path,
    ),
    GoRoute(
      builder: (context, state) => const RecycleBinScreen(),
      name: RecycleBinScreen.name,
      path: RecycleBinScreen.path,
    ),
  ],
  initialLocation: TabsScreen.path,
);
