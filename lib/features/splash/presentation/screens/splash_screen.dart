import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/coustome_logo.dart';
import '../../widgets/bottom_sheet.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF4A90E2),
            body: Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<SplashBloc>().add(ToggleBottomSheetEvent()),
                    child: const SizedBox(
                      height: 200,
                      child: SLogo(),
                    ),
                  ),
                ),
                // Bottom Sheet
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  bottom: state.showBottomSheet ? 0 : -300,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onVerticalDragUpdate: (details) {
                      context.read<SplashBloc>().add(
                        details.delta.dy > 5
                            ? HideBottomSheetEvent()
                            : ShowBottomSheetEvent(),
                      );
                    },
                    child: const BottomSheetWidget(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// BLoC Classes for managing state
class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashState(showBottomSheet: false));

  void add(SplashEvent event) {
    if (event is ToggleBottomSheetEvent) {
      emit(SplashState(showBottomSheet: !state.showBottomSheet));
    } else if (event is ShowBottomSheetEvent) {
      emit(SplashState(showBottomSheet: true));
    } else if (event is HideBottomSheetEvent) {
      emit(SplashState(showBottomSheet: false));
    }
  }
}

class SplashState {
  final bool showBottomSheet;

  SplashState({required this.showBottomSheet});
}

class SplashEvent {}

class ToggleBottomSheetEvent extends SplashEvent {}

class ShowBottomSheetEvent extends SplashEvent {}

class HideBottomSheetEvent extends SplashEvent {}
