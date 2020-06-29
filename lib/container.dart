import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart'; 
import 'package:responsive_example/image.dart';
import 'package:responsive_example/product.dart';
import 'package:responsive_example/rowhooli.dart';
import 'package:responsive_example/screen.dart';
import 'package:responsive_example/slider.dart';
import 'package:responsive_example/tabs.dart';
import 'package:responsive_example/utils.dart';

import 'back.dart';
import 'btn_hooli.dart';
import 'dropdown.dart';
import 'gradient.dart';

class StorePage extends StatefulWidget {
  StorePage({Key key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
   
  List<String> sucursales = ['Lanus', 'Quilmes', 'Bernal', 'Asdfsf', 'gfhfg'];
  String sucursal;
  List<String> tabs = ['Perfumeria', 'Farmacia'];
  String tab = 'Perfumeria';

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
     
    final endsMargin = w*0.0459;

    return Screen(
      appBarSVG: true,
      margin: -79.0,
      marginBody: 20,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: RowHooli(
          topMargin: 45,
          children: <Widget>[
            BackArrow(white: true, onTap: () {
           
            },),
            Spacer(flex: 1,),
            SvgPicture.asset(
              'assets/icon_buscar.svg',
              height: 30,
              width: 30,
              color: HooliColor.white
            ),
            GestureDetector(
              onTap: () {
               
              },
              child: SvgPicture.asset(
                'assets/icon_buscar.svg',
                height: 30,
                width: 30,
                color: HooliColor.white
              ),
            ),
          ]
        ),
      ),
      floatingAppBar: PreferredSize(
        preferredSize: Size.fromHeight(99),
        child: RowHooli(
          children: <Widget>[
            HooliImage(
              placeholderText: 'A',
              size: 99,
              url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
              imageFilePath: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
            ),
            SizedBox(width: 10,),
            Text(
              'Punto Farma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 24/20
              ),
            )
          ]
        ),
      ),
      appBarGradient: HooliGradient.blue_to_lightblue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RowHooli(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Nam porttitor blandit accumsan. Ut vel dictum sem, a pretium dui. In malesuada enim in dolor.',
                  style: TextStyle(
                    color: Color(0xFF686868),
                    fontSize: 18,
                    height: 25/18,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ],
          ),
          RowHooli(
            topMargin: 15,
            children: <Widget>[
              HooliImage(
                url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                height: 30,
                width: 30,
                circular: false,
              ),
              SizedBox(width: 10,),
              Text(
                'Av. de la Paz 11354',
                style: TextStyle(
                  color: Color(0xFFA7A7A7),
                  fontSize: 18,
                  height: 25/18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          RowHooli(
            topMargin: 10,
            children: <Widget>[
              HooliImage(
                url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                height: 30,
                width: 30,
                circular: false,
              ),
              SizedBox(width: 10,),
              Text(
                '+54 (9) 11-559-2382',
                style: TextStyle(
                  color: Color(0xFFA7A7A7),
                  fontSize: 18,
                  height: 25/18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          RowHooli(
            topMargin: 10,
            children: <Widget>[
              HooliImage(
                url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                height: 30,
                width: 30,
                circular: false,
              ),
              SizedBox(width: 10,),
              Text(
                'www.puntofarma.com',
                style: TextStyle(
                  color: Color(0xFFA7A7A7),
                  fontSize: 18,
                  height: 25/18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          RowHooli(
            topMargin: 45,
            bottomMargin: 16,
            children: <Widget>[
              Text(
                'Descuentos',
                style: TextStyle(
                  color: HooliColor.blue_hooli,
                  fontSize: 25,
                  height: 30/20,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
          HooliSlider.builder(
            height: 100,
            width: w,
            endsMargin: endsMargin,
            spacing: 10,
            itemCount: 8,
            itemBuilder: (context, i) {
              return GradientBorderContainer(
                height: 100,
                width: 100,
                borderGradient: HooliGradient.purple_to_pink,
                borderRadius: 200,
                child: Center(
                  child: Text(
                    '25',
                    style: TextStyle(
                      color: HooliColor.purple,
                      fontSize: 30,
                      height: 39/30,
                      fontWeight: FontWeight.bold
                    )
                  ),
                )
              );
            },
          ),
          RowHooli(
            topMargin: 46,
            bottomMargin: 16,
            children: <Widget>[
              Text(
                'Sucursales',
                style: TextStyle(
                  color: HooliColor.blue_hooli,
                  fontSize: 25,
                  height: 30/20,
                  fontWeight: FontWeight.w300
                ),
              ),
            ],
          ),
          HooliSlider.builder(
            width: w,
            endsMargin: endsMargin,
            height: 142,
            spacing: 10,
            itemCount: sucursales.length,
            itemBuilder: (context, i) {
              final suc = sucursales[i];
              final selected = suc == sucursal;

              if(selected) {
                return Container(
                  height: 142,
                  width: 133,
                  decoration: BoxDecoration(
                    gradient: HooliGradient.purple_to_pink,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: HooliImage(
                          url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                          height: 100,
                          width: 123,
                          circular: false,
                        ),
                      ),
                      SizedBox(height: 13,),
                      Text(
                        suc,
                        style: TextStyle(
                          color: HooliColor.white,
                          fontSize: 15,
                          height: 18/15,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    sucursal = suc;
                    setState(() {});
                  },
                  child: Container(
                    height: 136,
                    width: 133,
                    child: Column(
                      children: <Widget>[
                        HooliImage(
                          url:"https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                          height: 108,
                          width: 133,
                          circular: false,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          suc,
                          style: TextStyle(
                            color: Color(0xFF757474),
                            fontSize: 15,
                            height: 18/15,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    )
                  ),
                );
              }
            },
          ),
          RowHooli(
            topMargin: 20,
            children: <Widget>[
              if(sucursal != null) Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        HooliImage(
                          url: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                          height: 30,
                          width: 30,
                          circular: false,
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '0810-888-7110',
                          style: TextStyle(
                            color: Color(0xFF686868),
                            fontSize: 18,
                            height: 25/18,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Container(
                      height: 200,
                      
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        'A 1250mts de tu posición actual.',
                        style: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 16,
                          height: 22/16,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    )
                  ]
                ),
              )
            ],
          ),
          Container(
            width: w,
            margin: EdgeInsets.only(top: 20),
            color: Color.fromRGBO(99, 195, 209, 0.25),
            child: Column(
              children: <Widget>[
                RowHooli(
                  topMargin: 30,
                  children: <Widget>[
                    Text(
                      'Productos',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 25,
                        height: 30/20,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                    Spacer(flex: 1,),
                    SvgPicture.asset(
                      'assets/icon_buscar.svg',
                      height: 30,
                      width: 30,
                      color: HooliColor.blue_hooli,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                RowHooli(
                  leftMargin: 0,
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: TabsHooli(
                        activeItem: tab,
                        items: tabs,
                        onChanged: (change) {
                          tab = change;
                          setState(() {});
                        }
                      ),
                    ),
                    BtnHooli(
                      flex: 4,
                      height: 32,
                      fontSize: 16,
                      text: 'Recetas',
                      textColor: HooliColor.white,
                      gradient: HooliGradient.pink_to_yellow,
                      onTap: () {

                      }
                    )
                  ],
                ),
                RowHooli(
                  topMargin: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 95,
                      child: HooliDropdownFormField<String>(
                        showIcon: true,
                        initialValue: 'uno',
                        items: ['uno', 'dos', 'tres'],
                        onChanged: (change) {
                          
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          height: 20/18
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      
                      },
                      child: SvgPicture.asset(
                        'assets/icon_filter.svg',
                        width: 27,
                        height: 27,
                        color: HooliColor.blue_hooli,
                      ),
                    )
                  ],
                ),

                RowHooli(
                  topMargin: 40,
                  bottomMargin: 13,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Descuentos',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 11,
                        height: 13/11,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'Ir al pasillo',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 17,
                        height: 20/17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                HooliSlider.builder(
                  width: w,
                  endsMargin: endsMargin,
                  height: 310,
                  itemCount: 5,
                  spacing: 10,
                  itemBuilder: (context, i) {
                    return ProductInfoBox(
                      productPath:"https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                      name: 'Pañales Huggies Active Sec Baby...',
                      price: '1,031',
                      discount: '1,200',
                    );
                  },
                ),
                
                RowHooli(
                  topMargin: 40,
                  bottomMargin: 13,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'CUIDADO PERSONAL',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 11,
                        height: 13/11,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'Ir al pasillo',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 17,
                        height: 20/17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                HooliSlider.builder(
                  width: w,
                  endsMargin: endsMargin,
                  height: 310,
                  itemCount: 5,
                  spacing: 10,
                  itemBuilder: (context, i) {
                    return ProductInfoBox(
                      productPath: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                      name: 'Pañales Huggies Active Sec Baby...',
                      price: '1,031',
                      discount: '1,200',
                    );
                  },
                ),

                RowHooli(
                  topMargin: 40,
                  bottomMargin: 13,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Descuentos',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 11,
                        height: 13/11,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'Ir al pasillo',
                      style: TextStyle(
                        color: HooliColor.blue_hooli,
                        fontSize: 17,
                        height: 20/17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                HooliSlider.builder(
                  width: w,
                  endsMargin: endsMargin,
                  height: 310,
                  itemCount: 5,
                  spacing: 10,
                  itemBuilder: (context, i) {
                    return ProductInfoBox(
                      productPath: "https://cflvdg.avoz.es/default/2020/01/24/00121579869120958758165/Foto/GE25P48F2_133011.jpg",
                      name: 'Pañales Huggies Active Sec Baby...',
                      price: '1,031',
                      discount: '1,200',
                    );
                  },
                ),
                SizedBox(height: 50,)
              ],
            ),
          )
        ]
      ),
    );
  }
}