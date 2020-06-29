import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
import 'package:responsive_example/utils.dart';
import 'package:shimmer/shimmer.dart';

class HooliImage extends StatefulWidget {
  const HooliImage({
    Key key,
    this.placeholderText,
    this.size,
    @required this.url,
    this.circular = true,
    this.height,
    this.width,
    this.onImgLoaded,
    this.imageFilePath,
  }) : super(key: key);

  final String placeholderText;
  final String url;
  final String imageFilePath;
  final bool circular;
  final double height;
  final double width;
  final double size;
  final Function onImgLoaded;

  @override
  _HooliImageState createState() => _HooliImageState();
}

class _HooliImageState extends State<HooliImage> {
  bool exist = false;
  File image;

  @override
  void initState() { 
    super.initState();
    if(widget.imageFilePath != null && widget.imageFilePath != '') {
      image = File(widget.imageFilePath);
      image.exists().then((result) {
        exist = result;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var s = widget.url == "" ? null : widget.url;

    if(widget.circular) {
      if(exist) {
        return Container(
          key: UniqueKey(),
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            gradient: HooliGradient.gradientPurpleToPink,
            borderRadius: BorderRadius.all(Radius.circular(widget.size)),
            image: DecorationImage(
              image: FileImage(image)
            )
          ),
        );
      } else {
        return s == null
            ? Container(
                key: UniqueKey(),
                height: widget.size,
                width: widget.size,
                decoration: BoxDecoration(
                  gradient: HooliGradient.gradientPurpleToPink,
                  borderRadius: BorderRadius.all(Radius.circular(widget.size)),
                ),
                child: Center(
                  child: Text(
                    widget.placeholderText == null ? '' : widget.placeholderText.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.size * 0.5,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              )
            : CachedNetworkImage(
                key: UniqueKey(),
                imageUrl: widget.url,
                imageBuilder: (context, imageProvider) {
                  if(widget.onImgLoaded != null) Future.delayed(Duration(milliseconds: 50), () {
                    widget.onImgLoaded();
                  });
                  return Container(
                    height: widget.size,
                    width: widget.size,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(widget.size)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: HooliColor.light_gray_2,
                  highlightColor: HooliColor.light_gray,
                  child: Container(
                      height: widget.size,
                      width: widget.size,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(widget.size)),
                          color: HooliColor.gray)),
                ),
                errorWidget: (context, url, error) => Container(
                  height: widget.size,
                  width: widget.size,
                  decoration: BoxDecoration(
                    gradient: HooliGradient.gradientPurpleToPink,
                    borderRadius: BorderRadius.all(Radius.circular(widget.size)),
                  ),
                  child: Center(
                    child: Text(
                      widget.placeholderText == null ? '' : widget.placeholderText.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widget.size * 0.5,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              );
      }
    } else {
      return CachedNetworkImage(
        imageUrl: widget.url,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) {
          return Container(
            height: widget.height,
            width: widget.width,
            padding: EdgeInsets.all(widget.height/3),
            child: CircularProgressIndicator(strokeWidth: 1)
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            height: widget.height,
            width: widget.width,
            color: HooliColor.gray
          );
        },
      );
    }

  }
}
