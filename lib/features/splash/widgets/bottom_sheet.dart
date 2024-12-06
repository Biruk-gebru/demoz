import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left: Stacked circles
                        const CustomCircles(
                          size: 100, // Adjust size
                        ),
                        const SizedBox(width: 20), // Space between logo elements

                        // Right: CSS-inspired semi-circles
                        const CSSInspiredLogo(
                          width: 100,
                          height: 200,
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

class CustomCircles extends StatelessWidget {
  final double size;

  const CustomCircles({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double circleSize = size / 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFDEF2FE),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: circleSize,
          height: circleSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFD1EAFE),
          ),
        ),
      ],
    );
  }
}

class CSSInspiredLogo extends StatelessWidget {
  final double width;
  final double height;

  const CSSInspiredLogo({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Top semi-circle
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: width * 0.43,
              height: height * 0.35,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          // Bottom semi-circle
          Positioned(
            top: height * 0.35,
            left: 0,
            child: Container(
              width: width * 0.43,
              height: height * 0.35,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
        ],
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

// Bottom Sheet Widget
class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Title
          const Text(
            'Easy way to pay your tax on time',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'It is a long established fact that paying tax and other payments will be a tedious process to keep up.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
