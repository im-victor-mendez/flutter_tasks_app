import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'night_mode_event.dart';
part 'night_mode_state.dart';

class NightModeBloc extends HydratedBloc<NightModeEvent, NightModeState> {
  NightModeBloc() : super(const NightModeInitial()) {
    on<SwitchMode>((event, emit) => emit(NightModeState(!state.isActivated)));
  }

  @override
  NightModeState? fromJson(Map<String, dynamic> json) => state.fromJson(json);

  @override
  Map<String, dynamic>? toJson(NightModeState state) => state.toJson();
}
