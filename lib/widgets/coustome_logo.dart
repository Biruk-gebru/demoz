import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  final double width;
  final double height;

  const CustomLogo({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double semiCircleWidth = width / 2;
    final double circleSize = height / 3;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Left stacked circles
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
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
                const SizedBox(height: 5), // Adjust spacing
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD1EAFE),
                  ),
                ),
              ],
            ),
          ),

          // Right stacked semi-circles
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: semiCircleWidth,
              height: height,
              child: Stack(
                children: [
                  // Top semi-circle
                  Positioned(
                    top: 0,
                    child: Container(
                      width: semiCircleWidth,
                      height: height / 2,
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
                    top: height / 2 - 10, // Slight overlap adjustment
                    child: Container(
                      width: semiCircleWidth,
                      height: height / 2,
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
            ),
          ),
        ],
      ),
    );
  }
}
