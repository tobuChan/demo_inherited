
import 'package:badges/badges.dart';
import 'package:demo_inherited/shareWidget.dart';
import 'package:flutter/material.dart';

import 'myNotification.dart';
class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: (){
            ///修改数据
            // ShareWidget.of(context)!.setStatus(false);
            MyNotification("refresh").dispatch(context);
            setState(() {
              ShareWidget.of(context)!.message='已读';
              ShareWidget.of(context)!.status=false;
            });
          },
          child: Container(
            color: const Color.fromRGBO(237, 237, 237, 0.9),
            child: ListTile(
              title: Text('Jett'),
              leading: Image.network('https://www.itying.com/images/flutter/1.png',fit: BoxFit.cover,),
              subtitle: Text( ShareWidget.of(context)!.message),
              trailing: Badge(
                ///拿取数据
                  showBadge: ShareWidget.of(context)?.status??false,
                  badgeColor: Colors.red,
                  child: Text('')),
            ),
          ),
        ),
      ],
    );
  }
}
