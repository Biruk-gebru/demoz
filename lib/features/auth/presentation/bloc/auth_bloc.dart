// lib/features/splash/presentation/bloc/splash_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashEvent {}

class ToggleBottomSheetEvent extends SplashEvent {}
class ShowBottomSheetEvent extends SplashEvent {}
class HideBottomSheetEvent extends SplashEvent {}

class SplashState {
  final bool showBottomSheet;
  SplashState({required this.showBottomSheet});
}

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState(showBottomSheet: false));

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is ToggleBottomSheetEvent) {
      yield SplashState(showBottomSheet: !state.showBottomSheet);
    } else if (event is ShowBottomSheetEvent) {
      yield SplashState(showBottomSheet: true);
    } else if (event is HideBottomSheetEvent) {
      yield SplashState(showBottomSheet: false);
    }
  }
}
