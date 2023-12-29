import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks_app/blocs/night_mode_bloc/night_mode_bloc.dart';
import 'package:flutter_tasks_app/themes/app_theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/tasks_bloc/tasks_bloc.dart';
import 'blocs/bloc_observer.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => NightModeBloc()),
      ],
      child: BlocBuilder<NightModeBloc, NightModeState>(
        builder: (context, state) {
          final theme = state.isActivated
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme];

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routerConfig,
            theme: theme,
            title: 'Flutter Tasks App',
          );
        },
      ),
    );
  }
}
