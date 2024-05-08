import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    // Calculate coordinates relative to the size of the container
    final width = size.width;
    final height = size.height;

    path.moveTo(width * -0.0008600, height * -0.0006000);
    path.quadraticBezierTo(width * -0.0010400, height * 0.0998600,
        width * -0.0005600, height * 0.1498800);
    path.cubicTo(width * -0.0080800, height * 0.2016100, width * 0.1080400,
        height * 0.3010100, width * 0.2585600, height * 0.3013300);
    path.cubicTo(width * 0.4128200, height * 0.3019200, width * 0.5564400,
        height * 0.1373000, width * 0.6910200, height * 0.1494900);
    path.cubicTo(width * 0.8034600, height * 0.1606200, width * 0.7717200,
        height * 0.2493100, width * 0.8844800, height * 0.2512800);
    path.quadraticBezierTo(width * 0.9955400, height * 0.2521000,
        width * 1.0045000, height * 0.1504200);
    path.lineTo(width * 1.0034800, height * -0.0006800);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
