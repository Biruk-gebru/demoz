// lib/features/splash/presentation/bloc/splash_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

// States
class SplashState {
  final bool showBottomSheet;
  SplashState({required this.showBottomSheet});
}

// Events
abstract class SplashEvent {}
class ToggleBottomSheetEvent extends SplashEvent {}
class ShowBottomSheetEvent extends SplashEvent {}
class HideBottomSheetEvent extends SplashEvent {}

// Bloc
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState(showBottomSheet: false)) {
    on<ToggleBottomSheetEvent>((event, emit) {
      emit(SplashState(showBottomSheet: !state.showBottomSheet));
    });
    on<ShowBottomSheetEvent>((event, emit) {
      emit(SplashState(showBottomSheet: true));
    });
    on<HideBottomSheetEvent>((event, emit) {
      emit(SplashState(showBottomSheet: false));
    });
  }
}
