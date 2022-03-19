import 'package:demo_inherited/shareWidget.dart';
import 'package:flutter/material.dart';

import 'myNotification.dart';
class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  TextEditingController _textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: TextField(
              controller:_textEditingController ,
            ),
          ),
          ElevatedButton(
            onPressed: (){
              FocusScope.of(context).requestFocus(FocusNode());
              ///修改数据
              //  ShareWidget.of(context)!.setStatus(true);
              MyNotification("refresh").dispatch(context);
              setState(() {
                ShareWidget.of(context)?.message=_textEditingController.text;
                ShareWidget.of(context)?.status=true;
                _textEditingController.clear();

              });
            },
            child: const Text('发送消息'),
          ),
        ],
      ),
    );
  }
}
