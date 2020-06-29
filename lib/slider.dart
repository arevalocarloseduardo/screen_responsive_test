import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HooliSlider extends StatefulWidget {
  HooliSlider({
    @required this.height,
    @required this.width,
    @required this.items,
    this.endsMargin,
    this.spacing,
    this.onPageChanged,
  }) : this.itemCount = null, this.itemBuilder = null;

  HooliSlider.builder({
    @required this.height,
    @required this.width,
    @required this.itemCount,
    @required this.itemBuilder,
    this.spacing,
    this.endsMargin,
    this.onPageChanged,
  }) : this.items = null;

  final double height;
  final double width;
  final double endsMargin;
  final double spacing;
  final List<Widget> items;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Function(int index) onPageChanged;

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<HooliSlider> {
  ScrollController controller;
  bool moving = false;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            
          } else if (scrollNotification is ScrollUpdateNotification) {
            
          } else if (scrollNotification is ScrollEndNotification) {
            final margin = widget.endsMargin?? 0.0;
            final spacing = widget.spacing?? 0.0;
            final itemCount = (widget.itemCount?? widget.items.length) - 1;
            final total = scrollNotification.metrics.maxScrollExtent - widget.width;
            final current = scrollNotification.metrics.extentBefore;
            final itemsWidth = (total - (margin + (spacing * (itemCount-1))))/ itemCount;
            final posWidth = (margin * 2) + itemsWidth + (spacing * 2);
            final currentIndex = (current / posWidth).round() <= itemCount? (current / posWidth).round()  : itemCount;
            final itemPosition = posWidth * currentIndex;

            Future.delayed(Duration(milliseconds: 1), () async {
              if(!moving) {
                moving = true;
                await controller.animateTo(itemPosition, duration: Duration(milliseconds: 500), curve: Curves.linear);
                moving = false;
              }
            });
          }
          return false;
        },
        child: ListView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: widget.items?? List<Widget>.generate(widget.itemCount, (int i) {
            return Container(
              margin: EdgeInsets.only(left: i == 0 ? widget.endsMargin?? 0.0 : widget.spacing?? 0.0, right: widget.itemCount-1 == i? widget.width : 0.0),
              child: widget.itemBuilder(context, i)
            );
          }),
        ),
      ),
    );
  }
}