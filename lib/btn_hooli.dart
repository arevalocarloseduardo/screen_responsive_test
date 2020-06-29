import 'package:flutter/material.dart';
import 'package:responsive_example/utils.dart'; 

class BtnHooli extends StatefulWidget {
  /// Try to only use the factory constructors big, medium and small
  const BtnHooli({
    this.flex = 1,
    this.text,
    this.gradient,
    this.color,
    this.icon,
    this.iconMargin,
    this.child,
    this.enabled = true,
    @required this.onTap,
    this.textColor,
    this.borderColor,
    this.iconSize,
    this.fontWeight,
    @required this.height,
    @required this.fontSize,
  });

  factory BtnHooli.big({
    int flex = 1,
    String text,
    LinearGradient gradient,
    Color color,
    Color textColor,
    Color borderColor,
    Widget icon,
    int iconMargin,
    Widget child,
    @required Function onTap,
    bool enabled = true,
  }) {
    return BtnHooli(
      text: text,
      gradient: gradient,
      color: color,
      textColor: textColor,
      borderColor: borderColor,
      icon: icon,
      iconMargin: iconMargin,
      child: child,
      flex: flex,
      onTap: onTap, 
      enabled: enabled,
      height: 52,
      fontSize: 18,
    );
  }

  factory BtnHooli.medium({
    int flex = 1,
    String text,
    LinearGradient gradient,
    Color color,
    Color textColor,
    Color borderColor,
    Widget icon,
    int iconMargin, bool enabled = true,
    Widget child,
    @required Function onTap,
  }) {
    return BtnHooli(
      text: text,
      gradient: gradient,
      color: color,
      textColor: textColor,
      borderColor: borderColor,
      icon: icon,enabled: enabled,
      iconMargin: iconMargin,
      child: child,
      flex: flex,
      onTap: onTap,
      height: 52,
      fontSize: 18,
    );
  }

  factory BtnHooli.small({
    int flex = 1,
    String text,
    LinearGradient gradient,
    Color color,
    Color textColor,
    Color borderColor, bool enabled = true,
    Widget icon,
    int iconMargin,
    double iconSize,
    Widget child,
    @required Function onTap,
  }) {
    return BtnHooli(
      text: text,
      gradient: gradient,
      color: color,
      textColor: textColor,
      borderColor: borderColor,
      icon: icon,
      iconMargin: iconMargin,
      iconSize: iconSize,
      child: child,enabled: enabled,
      flex: flex,
      onTap: onTap,
      height: 42,
      fontSize: 16,
    );
  }

  final int flex;
  final bool enabled;
  final String text;
  final Widget icon;
  final int iconMargin;
  final double iconSize;
  final LinearGradient gradient;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final Widget child;
  final Function onTap;
  final int height;
  final int fontSize;
  final FontWeight fontWeight;

  @override
  _BtnHooliState createState() => _BtnHooliState();
}

class _BtnHooliState extends State<BtnHooli> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: ColorFiltered(
          colorFilter: widget.enabled
              ? ColorFilter.mode(
                  Colors.black.withOpacity(0.0), BlendMode.dstOut)
              : ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstOut),
          child: GestureDetector(
            onTap: widget.enabled
                ? widget.onTap ??
                    () async {
                      if (!loading) {
                        loading = true;
                        try {
                          await widget.onTap();
                        } catch (e) {
                          print(e);
                        }
                        loading = false;
                      }
                    }
                : null,
            child: Container(
                height: widget.height.toDouble(),
                decoration: BoxDecoration(
                    color: widget.color != null
                        ? widget.color
                        : widget.gradient == null ? Colors.transparent : null,
                    gradient: widget.color != null ? null : widget.gradient,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(
                        width: 1,
                        color: widget.borderColor ?? Colors.transparent)),
                child: widget.child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (widget.icon != null)
                          Container(
                            height: 34,
                            width: 34,
                            margin: EdgeInsets.only(
                                right: widget.iconMargin == null
                                    ? 5
                                    : widget.iconMargin.toDouble()),
                            child: Container(
                                alignment: Alignment.center,
                                height: widget.iconSize ?? 24,
                                width: widget.iconSize ?? 24,
                                child: widget.icon),
                          ),
                        Text(
                          widget.text ?? '',
                          style: TextStyle(
                            color: widget.textColor ?? HooliColor.purple,
                            fontSize: widget.fontSize.toDouble(),
                            fontWeight: widget.fontWeight ?? FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
          )),
    );
  }
}
