import 'package:flutter/material.dart'; 
import 'package:responsive_example/utils.dart';
import 'package:shimmer/shimmer.dart';

class HooliInfoField extends StatelessWidget {
  const HooliInfoField(
      {Key key,
      @required this.label,
      @required this.value,
      this.isLoading=false,
      this.bottomBorder = false})
      : super(key: key);

  final String label;
  final String value;
  final bool bottomBorder;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-1, 0),
      margin: EdgeInsets.only(top: 20),
      height: 62.5,
      decoration: bottomBorder
          ? BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 1, color: HooliColor.purple)))
          : BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label ?? '',
            style: TextStyle(
                color: HooliColor.blue_hooli,
                fontSize: 11,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 9,
          ),
          value == null && isLoading==true?
          Shimmer.fromColors(
            baseColor: HooliColor.light_gray_2,
            highlightColor: HooliColor.light_gray,
            child: Container(
                height: 24,
                width: 24.0 * 8,
                decoration: BoxDecoration(color: HooliColor.gray)),
          ):
          Text(
            value == null || value == ''
                ? ''
                : value.length > 27 ? value.substring(0, 27) : value,
            style: TextStyle(
                color: HooliColor.gray,
                fontSize: 26,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}

class HooliInfoDoubleField extends StatelessWidget {
  const HooliInfoDoubleField(
      {Key key,
      @required this.firstFieldlabel,
      @required this.firstFieldValue,
      @required this.secondFieldlabel,
      @required this.secondFieldValue,
      this.bottomBorder = false})
      : super(key: key);

  final String firstFieldlabel;
  final String firstFieldValue;
  final String secondFieldlabel;
  final String secondFieldValue;
  final bool bottomBorder;

  @override
  Widget build(BuildContext context) {
    double viewWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: viewWidth * 0.44,
          child: HooliInfoField(
            bottomBorder: bottomBorder,
            label: firstFieldlabel,
            value: firstFieldValue,
          ),
        ),
        Container(
          width: viewWidth * 0.44,
          child: HooliInfoField(
            bottomBorder: bottomBorder,
            label: secondFieldlabel,
            value: secondFieldValue,
          ),
        ),
      ],
    );
  }
}
