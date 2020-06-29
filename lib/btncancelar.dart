import 'package:flutter/material.dart';
import 'package:responsive_example/utils.dart'; 

class BtnCancelar extends StatelessWidget {
  const BtnCancelar({
    this.text,
    this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final viewWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap?? () {},
      child: Container(
        child: Text(text?? 'Cancelar', style: TextStyle(
          color: HooliColor.gray,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}