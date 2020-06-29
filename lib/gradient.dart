import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  const GradientBorderContainer({
    Key key,
    @required this.borderGradient,
    this.gradient,
    this.borderRadius,
    this.child,
    this.alignment,
    this.padding,
    @required this.height,
    @required this.width,
    this.margin,
    this.transform,
    this.color,
  }) : super(key: key);

  final LinearGradient borderGradient;
  final LinearGradient gradient;
  final double borderRadius;
  final Widget child;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final Matrix4 transform;
  final Color color; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      transform: transform,
      alignment: alignment,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: ShaderMask(
              shaderCallback: (rect) {
                return borderGradient.createShader(rect);
              },
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(borderRadius?? 10)
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: EdgeInsets.only(top: 1, left: 1),
              height: height-2,
              width: width-2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius?? 10),
                gradient: gradient,
                border: color == null? null : Border.all(width: 1, color: Colors.transparent),
                color: color,
              ),
              padding: padding,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}