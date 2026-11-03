import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/constants/colors/Ucolors.dart';

class CurvedBottomClipper extends CustomClipper<Path> {
  /// How much the curve dips. Bigger = deeper curve.
  final double curveHeight;

  const CurvedBottomClipper({this.curveHeight = 30});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveHeight,
      size.width,
      size.height - curveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CurvedBottomClipper oldClipper) =>
      oldClipper.curveHeight != curveHeight;
}

/// The pink curved background placed at the top of the auth stack.
class CurvedHeader extends StatelessWidget {
  final double height;
  final Color color;
  final Widget? child;

  const CurvedHeader({
    super.key,
    this.height = 477,
    this.color = Ucolors.headerPink,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: const CurvedBottomClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        color: color,
        child: child,
      ),
    );
  }
}
