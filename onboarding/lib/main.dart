// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ColoredBox(
          color: Color.fromARGB(255, 240, 207, 105),
          child: Center(
            child: TransitionButton(page: 1),
          ),
        ),
      ),
    );
  }
}

class TransitionButton extends StatelessWidget {
  final int page;

  const TransitionButton({
    super.key,
    required this.page,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: TransitionPainter(page: page)),
          const Icon(Icons.chevron_right, color: Color.fromARGB(255, 240, 207, 105),),
        ],
      ),
    );
  }
}

class TransitionPainter extends CustomPainter {
  
  final int page;

   TransitionPainter({
    required this.page,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double percent = page * 0.25;
    
    paintCircle(canvas, size);
    
    paintFilledArc(canvas, size, percent);

    paintBlankArc(canvas, size, percent);
  }

  void paintBlankArc(Canvas canvas, Size size, double percent) {

    final paint = Paint();
    paint.color = const Color.fromARGB(150, 255, 255, 255);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawArc(
      Offset.zero & size,
      2 * pi * (percent - 0.25), 
      2 * pi * (1 - percent), 
      false, 
      paint
    );
  }

  void paintFilledArc(Canvas canvas, Size size, double percent) {

    final paint = Paint();
    paint.color = const Color.fromARGB(255, 255, 255, 255);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;
    canvas.drawArc(
      Offset.zero & size, 
      -pi / 2, 
      2 * pi * percent, 
      false, paint
    );
  }

  void paintCircle(Canvas canvas, Size size) {

    final paint = Paint();
    paint.color = const Color.fromARGB(255, 255, 255, 255);
    canvas.drawCircle(
      Offset(
        size.width / 2, 
        size.height / 2
      ), 
      21, 
      paint
    );
  }
    
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}