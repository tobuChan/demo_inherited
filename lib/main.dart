import 'package:demo_inherited/shareWidget.dart';
import 'package:demo_inherited/state.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

import 'PageOne.dart';
import 'PageTwo.dart';
import 'myNotification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///包裹materialAPP，从顶层共享数据
    return ShareWidget(shareData:DataState(status: false,message: '已读'), child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),

    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin{
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        print(notification.msg);
        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            controller:tabController ,
            tabs: [
              Badge(
                ///拿取数据
                  showBadge: ShareWidget.of(context)?.status??false,
                  badgeColor: Colors.red,
                  child: const Text('消息',style: TextStyle(fontSize: 20),)),
              const Text('发送',style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            PageOne(),
            PageTwo()
          ],
        )

      ),
    );
  }
}
