import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    debugPrint('''
      bloc: $bloc
      event: $event
    ''');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    debugPrint('''
      bloc: $bloc
      error: $error
      stackTrace: $stackTrace
    ''');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    debugPrint('''
      bloc: $bloc
      change: $change
    ''');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    debugPrint('''
      bloc: $bloc
      transition: $transition
    ''');
  }
}
