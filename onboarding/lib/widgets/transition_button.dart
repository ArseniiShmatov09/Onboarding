// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding/constants/colors.dart';

class TransitionButton extends StatelessWidget {
  final int page;
  final Color? iconColor;

  const TransitionButton({
    super.key,
    required this.page,
    required this.iconColor,
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
            Icon(
              Icons.chevron_right, 
              color: iconColor,
          ),
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
    paint.color = AppColors.fadedWhiteColor;
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
    paint.color = AppColors.whiteColor;
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
    paint.color = AppColors.whiteColor;
    canvas.drawCircle(
      Offset(
        size.width / 2, 
        size.height / 2,
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