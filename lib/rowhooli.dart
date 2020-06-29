import 'package:flutter/material.dart';

class RowHooli extends StatelessWidget {
  const RowHooli({
    @required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.topMargin = 0,
    this.bottomMargin = 0,
    this.leftMargin,
    this.rightMargin,
    this.color,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final double topMargin;
  final double bottomMargin;
  final double leftMargin;
  final double rightMargin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width;
    return Container(
      color: color ?? Colors.transparent,
      margin: EdgeInsets.fromLTRB(
        leftMargin ?? viewWidth * 0.0459,
        topMargin,
        rightMargin ?? viewWidth * 0.0459,
        bottomMargin,
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      ),
    );
  }
}
