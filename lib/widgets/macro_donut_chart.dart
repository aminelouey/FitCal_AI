import 'package:flutter/material.dart';
import 'dart:math';

class MacroDonutChart extends StatelessWidget {
  final double protein;
  final double carbs;
  final double fat;

  const MacroDonutChart({
    super.key,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  @override
  Widget build(BuildContext context) {
    final total = protein + carbs + fat;
    
    return SizedBox(
      width: 200,
      height: 200,
      child: CustomPaint(
        painter: DonutChartPainter(
          protein: protein / total,
          carbs: carbs / total,
          fat: fat / total,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'كربوهيدرات',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${carbs.toInt()} جم',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonutChartPainter extends CustomPainter {
  final double protein;
  final double carbs;
  final double fat;

  DonutChartPainter({
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final innerRadius = radius * 0.6;
    final strokeWidth = radius - innerRadius;

    final proteinPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final carbsPaint = Paint()
      ..color = Colors.yellow[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final fatPaint = Paint()
      ..color = Colors.red[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    double startAngle = -pi / 2;

    // Draw protein arc
    double proteinAngle = 2 * pi * protein;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      startAngle,
      proteinAngle,
      false,
      proteinPaint,
    );
    startAngle += proteinAngle;

    // Draw carbs arc
    double carbsAngle = 2 * pi * carbs;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      startAngle,
      carbsAngle,
      false,
      carbsPaint,
    );
    startAngle += carbsAngle;

    // Draw fat arc
    double fatAngle = 2 * pi * fat;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
      startAngle,
      fatAngle,
      false,
      fatPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
