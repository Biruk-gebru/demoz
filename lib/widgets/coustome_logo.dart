import 'package:flutter/material.dart';

class SLogo extends StatelessWidget {
  const SLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // "S" shape
        SizedBox(
          width: 120,
          height: 200,
          child: Stack(
            children: [
              // Top half-circle
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 47,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                ),
              ),
              // Bottom half-circle with overlap
              Align(
                alignment: Alignment.bottomLeft,
                child: Transform.translate(
                  offset: const Offset(0, -80),
                  child: Container(
                    width: 47,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Circles in front of the "S" shape
        Positioned(
          top: 0,
          right: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFE0F7FA),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFB3E5FC),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
