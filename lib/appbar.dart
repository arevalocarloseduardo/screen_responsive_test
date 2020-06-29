import 'package:flutter/material.dart'; 
import 'package:responsive_example/utils.dart';
import 'back.dart';
import 'btncancelar.dart';

class HooliAppBar extends StatelessWidget {
  const HooliAppBar(
      {Key key,
      this.automaticTopBar = true,
      this.titleCenter,
      this.onPressCancelar,
      this.trealingText,
      this.nameInfo})
      : super(key: key);

  final bool titleCenter;
  final bool automaticTopBar;
  final String trealingText;
  final Function onPressCancelar;
  final String nameInfo;

  @override
  Widget build(BuildContext context) {
    var viewWidth = MediaQuery.of(context).size.width;
    var porcentMargin = 9.18;
    return nameInfo != null
        ? Container(
            height: 161,
            width: viewWidth,
            child: Stack(
              alignment: AlignmentDirectional.center,
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  width: viewWidth,
                  height: 161,
                  child: CustomPaint(
                    painter: _HooliBackground(
                      color: HooliColor.blue_hooli,
                      gradient: HooliGradient.purple_to_lightblue,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  width: viewWidth - viewWidth * porcentMargin / 100,
                  height: 161,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            BackArrow(onTap: () {
                           
                            },white:true)
                          ],
                        ),
                        Container(
                          height: 86,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      nameInfo,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            width: viewWidth - viewWidth * porcentMargin / 100,
            child: Column(
              children: <Widget>[
                Container(height: 40),
                Container(
                  height: 40,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      automaticTopBar
                          ? BackArrow(onTap: () {
                           
                            })
                          : Container(),
                      Expanded(child: Container()),
                      onPressCancelar != null
                          ? BtnCancelar(
                              text: trealingText ?? "Cancelar",
                              onTap: onPressCancelar)
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}

class _HooliBackground extends CustomPainter {
  final Color color;
  final LinearGradient gradient;
  const _HooliBackground({this.gradient, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (gradient != null) {
      Rect rect = Rect.fromCircle(
        center: Offset(size.width * 0.5, 0),
        radius: 180,
      );
      paint.shader = gradient.createShader(rect);
    } else {
      paint.color = color;
    }
    paint.style = PaintingStyle.fill;

    Path path = Path();
    Path path2 = Path();

    path.addArc(
        Rect.fromLTWH(0 - size.width * 0.5, 0, size.width * 2, size.height),
        0,
        45);

    path2.lineTo(0, size.height * 0.5);
    path2.lineTo(size.width, size.height * 0.5);
    path2.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
