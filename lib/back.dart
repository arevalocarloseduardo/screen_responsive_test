import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 

class BackArrow extends StatelessWidget {
  const BackArrow({
    this.onTap,
    this.white = false,
    this.size,
  });

  final Function onTap;
  final bool white;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
          //  NavigationService.pop();
          },
      child: SvgPicture.asset(
        'assets/icon_volver.svg',
        fit: BoxFit.fill,
        height: size?? 24,
        color: white?Colors.white:null,
        width: size?? 24,
      ),
    );
  }
}
