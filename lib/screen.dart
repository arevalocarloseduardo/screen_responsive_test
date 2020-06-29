import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:responsive_example/rowhooli.dart';
import 'package:responsive_example/utils.dart';

import 'back.dart';

class Screen extends StatefulWidget {
  Screen({
    Key key,
    this.appBar,
    this.appBarGradient,
    this.body,
    this.floatingAppBar,
    this.margin = 0,
    this.marginBody = 0,
    this.appBarSVG = false,
    this.navBar: true,
    this.hiddenAppBar,
  }) : super(key: key);

  factory Screen.titleOnly({
    String title,
    String actionText,
    Function onActionTap,
    Widget body,
    LinearGradient gradient,
  }) {
    return Screen(
      navBar: false,
      margin: -66,
      marginBody: 55,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(161),
        child: RowHooli(
          topMargin: 45,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BackArrow(white: true, size: 30),
            if(actionText != null) GestureDetector(
              onTap: onActionTap?? () {},
              child: Container(
                height: 40,
                width: 100,
                child: Align(
                  alignment: Alignment(1,0),
                  child: Text(
                    actionText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 22/17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      appBarGradient: gradient?? HooliGradient.purple_to_lightblue,
      floatingAppBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: RowHooli(
          children: <Widget>[
            Text(
              title?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                height: 30/25
              ),
            ),
          ],
        ),
      ),
      body: body?? Container()
    );
  }

  /// The height of this appBar will determine the height of the gradient
  final PreferredSizeWidget appBar;
  final LinearGradient appBarGradient;
  /// This widget will be shown as part of the body
  /// use the margin to let the body move above the header
  final PreferredSizeWidget floatingAppBar;
  final Widget body;
  /// Use a negative value so that the floating widget goes above the header
  final double margin;
  /// Extra margin for the body alone, can be negative
  final double marginBody;
  final bool appBarSVG;
  final bool navBar;
  final Widget hiddenAppBar;

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  ScrollController controller;
  bool onManualScroll = false;
  double distanceToTravel = 0;
  double speed = 1;
  double posY = 0;
  double marginFloating = 0;
  double marginBody = 0;

  @override
  void initState() {
    controller = ScrollController();

    if(widget.appBar != null) {
      marginBody += widget.appBar.preferredSize.height;
      marginFloating += widget.appBar.preferredSize.height;
    }

    if(widget.floatingAppBar != null) {
      marginBody += widget.floatingAppBar.preferredSize.height;
    }

    if(widget.margin != null) {
      marginBody += widget.margin;
      marginFloating += widget.margin;
    }

    if(widget.marginBody != null) {
      marginBody += widget.marginBody;
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final appBarHeight = widget.appBar == null? 0 : widget.appBar.preferredSize.height;
    final notchSpace = MediaQuery.of(context).viewPadding.top;
    final condensedHeight = 100.0 + notchSpace;
    final gradientY = (appBarHeight + posY) <= condensedHeight? -(appBarHeight - condensedHeight) : posY;
    final navBarHeight = 50;
    final floatingHeight = widget.floatingAppBar.preferredSize.height + marginFloating;
    final floatingShown = floatingHeight + posY;
    final opacity = 1.0 - ((floatingShown > 0? floatingShown : 0) / floatingHeight).abs();

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: NotificationListener(
          onNotification: (event) {
            if(this.mounted) {
              FocusScope.of(context).unfocus();
              posY = -controller.offset;
              setState(() {});
            }
            return false;
          },
          child: Stack(
            children: <Widget>[
              if(widget.body != null) Positioned(
                left: 0,
                bottom: 0,
                width: w,
                height: h - (widget.navBar? navBarHeight : 0),
                child: ListView(
                  controller: controller,
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: marginBody),
                      child: widget.body
                    )
                  ]
                ),
              ),
              if(widget.appBar != null) ...[
                Positioned(
                  top: gradientY,
                  left: 0,
                  width: w,
                  child: Container(
                    height: appBarHeight,
                    width: w,
                    child: CustomPaint(
                      painter: _HooliBackground(
                        gradient: widget.appBarGradient?? HooliGradient.pink_to_yellow
                      ),
                    ),
                  ),
                ),
                if(widget.appBarSVG) Positioned(
                  top: gradientY,
                  left: 0,
                  child: ClipPath(
                    clipper: _HooliBackgroundClipper(),
                    child: SvgPicture.asset(
                      "assets/bg/bg_card.svg",
                      height: appBarHeight,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  width: w,
                  child: widget.appBar,
                ),
                if(widget.hiddenAppBar != null) Positioned(
                  top: 0,
                  left: 0,
                  height: condensedHeight,
                  width: w,
                  child: Opacity(
                    opacity: opacity > 0.5? opacity : 0.0,
                    child: widget.hiddenAppBar
                  ),
                ),
              ],
              if(widget.floatingAppBar != null) Positioned(
                top: marginFloating + posY,
                left: 0,
                width: w,
                child: widget.floatingAppBar,
              ),
            ],
          ),
        ),
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
    if(gradient != null) {
      Rect rect = Rect.fromCircle(
        center: Offset(size.width*0.5, 0),
        radius: 180,
      );
      paint.shader = gradient.createShader(rect);
    } else {
      paint.color = color;
    }
    paint.style = PaintingStyle.fill;

    Path path = Path();
    Path path2 = Path();
    
    path.addArc(Rect.fromLTWH(0-size.width*0.5, 0, size.width*2, size.height), 0, 45);

    path2.lineTo(0, size.height*0.5);
    path2.lineTo(size.width, size.height*0.5);
    path2.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HooliBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final h = size.height;
    final w = size.width;
    final c = h*9;

    path.moveTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, c);
    path.quadraticBezierTo(w*0.5, h, 0, c);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}