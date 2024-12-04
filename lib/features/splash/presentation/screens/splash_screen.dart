// lib/features/splash/presentation/screens/splash_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/bottom_sheet.dart';
import '../bloc/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/presentation/screens/signup_screen.dart';

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
                // Splash Content
                Center(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<SplashBloc>().add(ToggleBottomSheetEvent()),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'DEMOZ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
                          details.delta.dy > 5 ? HideBottomSheetEvent() : ShowBottomSheetEvent());
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
