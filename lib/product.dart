import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:responsive_example/utils.dart';

class ProductInfoBox extends StatelessWidget {
  const ProductInfoBox({
    Key key,
    this.productPath,
    this.name,
    this.price,
    this.discount,
  }) : super(key: key);

  final String productPath;
  final String name;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    final gray = HooliColor.light_gray_3;// Color(0xFFD3DDDE);
    return GestureDetector(
      onTap: () {
       
      },
      child: Container(
        height: 215,
        width: 123,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: productPath,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 118,
                  width: 122,
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
                  height: 118,
                  width: 122,
                  child: CircularProgressIndicator(strokeWidth: 1)
                );
              },
              errorWidget: (context, url, error) {
                return Container(
                  height: 118,
                  width: 122,
                  color: HooliColor.gray
                );
              },
            ),
            Text(
              name?? '',
              style: TextStyle(
                color: Color(0xFF686868),
                fontSize: 15,
                height: 18/15,
                fontWeight: FontWeight.w300
              ),
            ),
            if(price != null) Row(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icon_dinero.svg',
                  color: HooliColor.green_hooli,
                  height: 18,
                  width: 18,
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: HooliColor.green_hooli,
                    fontSize: 24,
                    height: 29/24,
                    fontWeight: FontWeight.w300
                  ), 
                ),
              ],
            ),
            if(discount != null) Stack(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/icon_dinero.svg',
                      color: gray,
                      height: 12,
                      width: 12,
                    ),
                    Text(
                      discount,
                      style: TextStyle(
                        color: gray,
                        fontSize: 16,
                        height: 20/16,
                        fontWeight: FontWeight.w300
                      ), 
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 12 + (discount.length * 8.0),
                  height: 2,
                  color: gray
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}