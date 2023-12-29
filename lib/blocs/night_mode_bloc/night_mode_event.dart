part of 'night_mode_bloc.dart';

sealed class NightModeEvent extends Equatable {
  const NightModeEvent();

  @override
  List<Object> get props => [];
}

class SwitchMode extends NightModeEvent {}
