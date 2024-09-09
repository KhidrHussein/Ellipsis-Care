import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:flutter/widgets.dart';

class AppClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    final double xScaling = size.width / 247;
    final double yScaling = size.height / 220;
    path.lineTo(233 * xScaling, 118.157 * yScaling);
    path.cubicTo(
      233 * xScaling,
      171.176 * yScaling,
      178.114 * xScaling,
      206 * yScaling,
      119.724 * xScaling,
      206 * yScaling,
    );
    path.cubicTo(
      61.3343 * xScaling,
      206 * yScaling,
      14 * xScaling,
      163.019 * yScaling,
      14 * xScaling,
      110 * yScaling,
    );
    path.cubicTo(
      14 * xScaling,
      56.9807 * yScaling,
      61.3343 * xScaling,
      14 * yScaling,
      119.724 * xScaling,
      14 * yScaling,
    );
    path.cubicTo(
      178.114 * xScaling,
      14 * yScaling,
      233 * xScaling,
      65.1375 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
    );
    path.cubicTo(
      233 * xScaling,
      118.157 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

class AppPainter extends CustomPainter {
  AppPainter() : super() {
    addListener(() {});
  }
  @override
  void paint(Canvas canvas, Size size) {
  
    Path path = Path();
    final double xScaling = size.width / 247;
    final double yScaling = size.height / 220;
    path.lineTo(233 * xScaling, 118.157 * yScaling);
    path.cubicTo(
      233 * xScaling,
      171.176 * yScaling,
      178.114 * xScaling,
      206 * yScaling,
      119.724 * xScaling,
      206 * yScaling,
    );
    path.cubicTo(
      61.3343 * xScaling,
      206 * yScaling,
      14 * xScaling,
      163.019 * yScaling,
      14 * xScaling,
      110 * yScaling,
    );
    path.cubicTo(
      14 * xScaling,
      56.9807 * yScaling,
      61.3343 * xScaling,
      14 * yScaling,
      119.724 * xScaling,
      14 * yScaling,
    );
    path.cubicTo(
      178.114 * xScaling,
      14 * yScaling,
      233 * xScaling,
      65.1375 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
    );
    path.cubicTo(
      233 * xScaling,
      118.157 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
      233 * xScaling,
      118.157 * yScaling,
    );

    final paintBrush = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
