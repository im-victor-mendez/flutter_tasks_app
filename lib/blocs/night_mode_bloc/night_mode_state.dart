part of 'night_mode_bloc.dart';

class NightModeState extends Equatable {
  final bool isActivated;
  const NightModeState(this.isActivated);

  @override
  List<Object> get props => [isActivated];

  Map<String, dynamic> toJson() => {
        'isActivated': isActivated,
      };

  NightModeState fromJson(Map<String, dynamic> json) =>
      NightModeState(json['isActivated'] ?? false);
}

final class NightModeInitial extends NightModeState {
  const NightModeInitial() : super(false);
}
