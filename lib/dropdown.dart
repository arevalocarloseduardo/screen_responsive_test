import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:flutter/widgets.dart';
import 'package:responsive_example/utils.dart';
import 'custom_drop.dart'as custom;
import 'infoField.dart';

class HooliDropdownFormField<T> extends StatefulWidget {
  const HooliDropdownFormField({
    Key key,
    this.label,
    @required this.initialValue,
    @required this.items,
    @required this.onChanged,
    this.marginTop,
    this.showIcon = false,
    this.labelSize,
    this.centered = false,
    this.style,
    this.noBorder: false,
  }) : super(key: key);

  final double marginTop;
  final String label;
  final T initialValue;
  final List<T> items;
  final dynamic Function(dynamic) onChanged;
  final bool showIcon;
  final bool centered;
  final double labelSize;
  final TextStyle style;
  final bool noBorder;

  @override
  __HooliDropdownFormFieldState createState() => __HooliDropdownFormFieldState(initialValue, onChanged);
}

class __HooliDropdownFormFieldState<T> extends State<HooliDropdownFormField<T>> {
  __HooliDropdownFormFieldState(this.currentValue, this.onChanged);

  T currentValue;
  final dynamic Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    // double viewHeight = MediaQuery.of(context).size.height;
    // double viewWidth = MediaQuery.of(context).size.width;

    if(widget.items.isEmpty) {
      return HooliInfoField(
        label: widget.label?? '',
        value: 'Loading',
        bottomBorder: true,
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: widget.marginTop?? 20),
        decoration: BoxDecoration(
          border: widget.noBorder? null : Border(bottom: BorderSide(width: 1, color: HooliColor.purple))
        ),
        child: Column(
          crossAxisAlignment: widget.centered? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: <Widget>[
            if(widget.label != null) Text(
              widget.label,
              style: TextStyle(
                fontSize: widget.labelSize?? 11,
                color:HooliColor.blue_hooli,
                //fontWeight:  HooliTextWeight.bold,
                height: 10/(widget.labelSize?? 11)
              ),
            ),
            // SizedBox(height: widget.labelSize == null? 0 : widget.labelSize*0.25,),
            GestureDetector(
              onTap: () {
                Future.delayed(Duration(milliseconds: 250), () {
                  Scrollable.ensureVisible(context);
                });
              },
              child: custom.DropdownButtonHideUnderline(
                child: custom.DropdownButton<T>(
                  value: currentValue,
                  style: widget.style?? TextStyle(
                    color: HooliColor.gray,
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                    height: 25/26
                  ),
                  isExpanded: true,
                  icon: widget.showIcon? SvgPicture.asset('assets/icon_flecha_select.svg'): Container(),
                  items: widget.items.map<custom.DropdownMenuItem<T>>(
                    (value) => custom.DropdownMenuItem<T>(
                        value: value,
                        child: Container(
                          alignment: Alignment(widget.centered? 0 : -1,0),
                          child: Text(value.toString().length > 27? value.toString().substring(0, 27) : value.toString(), style: widget.style?? TextStyle(
                            color: HooliColor.gray,
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                            height: 25/26
                          )
                      ),
                        )
                    )
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged(value);
                      currentValue = value;
                    });
                  },
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
