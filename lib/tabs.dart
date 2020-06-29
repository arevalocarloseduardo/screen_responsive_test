import 'package:flutter/material.dart'; 
import 'package:responsive_example/rowhooli.dart';
import 'package:responsive_example/utils.dart';

class TabsHooli<T> extends StatefulWidget {
  TabsHooli({
    Key key,
    @required this.activeItem,
    @required this.items,
    @required this.onChanged,
  }) : super(key: key);

  final T activeItem;
  final List<T> items;
  final Function(T) onChanged;

  @override
  _TabsHooliState<T> createState() => _TabsHooliState<T>(
    activeItem: activeItem,
    items: items,
    onChanged: onChanged
  );
}

class _TabsHooliState<T> extends State<TabsHooli> {
  _TabsHooliState({
    @required this.activeItem,
    @required this.items,
    @required this.onChanged,
  });
  final GlobalKey key = GlobalKey();

  T activeItem;
  final List<T> items;
  final Function(T) onChanged;

  @override
  void initState() { 
    super.initState();
    waitFirstMount();
  }

  Future<void> waitFirstMount() async {
    Future.delayed(Duration(milliseconds: 17), () {
      if(this.mounted) {
        setState(() {});
      } else {
        waitFirstMount();
      }
    });
  }

  double getBarPosition(GlobalKey key, int items, int index) {
    try {
      RenderBox box = key.currentContext.findRenderObject();
      final itemWidth = box.size.width/items;
      return index * itemWidth;
    } catch (e) {
      return 0;
    }
  }

  double getBarWidth(GlobalKey key, int items) {
    try {
      RenderBox box = key.currentContext.findRenderObject();
      return box.size.width/items;
    } catch (e) {
      return 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return RowHooli(
      children: <Widget>[
        Expanded(
          key: key,
          flex: 1,
          child: Container(
            height: 32,
            child: Stack(
              children: <Widget>[
                Row(
                  children: List<Widget>.generate(items.length, (index) {
                    final item = widget.items[index];
                    final active = activeItem == item;
                    return Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          activeItem = item;
                          if(onChanged != null) onChanged(item);
                          setState(() {});
                        },
                        child: Container(
                          height: 32,
                          child: Center(
                            child: Text(
                              item.toString(),
                              style: TextStyle(
                                color: active? HooliColor.purple : HooliColor.gray,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                ),

                AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: 0,
                  left: getBarPosition(key, items.length, items.indexOf(activeItem)),
                  child: Container(
                    height: 2,
                    width: getBarWidth(key, items.length),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF9373B1), Color(0xFFE56DA1)],
                        
                      )
                    ),
                  )
                )
              ],
            )
          ),
        )
      ],
    );
  }
}