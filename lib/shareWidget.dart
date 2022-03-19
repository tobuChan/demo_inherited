
import 'package:demo_inherited/state.dart';
import 'package:flutter/cupertino.dart';

class ShareWidget extends InheritedWidget {

  // 需要共享的数据，可以是单个数据，也可以是多个数据
  // 多个数据建议封装成一个类来进行管理，如这里的DataState，里面可以根据实际需求添加更多的字段。
  // final int shareData;  // 单个值可以不用封装成类，直接定义，但实际需求往往更复杂，因此建议统一使用外部的管理类来管理
  final DataState shareData; // 建议定义类来统一管理共享数据，一个或者多个数据。

  // 构造函数
  const ShareWidget({
    Key? key,
    required this.shareData,
    required Widget child,
  }) : super(key: key, child: child);

  // // 写法1:返回组件对象
  // static ShareWidget? of(BuildContext context) {
  //   // return context.inheritFromWidgetOfExactType(ShareWidget);
  //   // 上面的方法在v1.12.1之后被弃用，改为使用下面的dependOnInheritedWidgetOfExactType。
  //   return context.dependOnInheritedWidgetOfExactType<ShareWidget>();
  // }

  // 写法2:直接返回共享数据
  static DataState? of(BuildContext context) {
    final ShareWidget? shareWidget =
    context.dependOnInheritedWidgetOfExactType<ShareWidget>();
    return shareWidget?.shareData;
  }

  //该回调决定当状态发生变化时，是否通知子树中依赖的该组件
  @override
  bool updateShouldNotify(ShareWidget oldWidget) {
    // 是否需要更新，返回true则更新
    // 当返回true时，如果在子child的build函数中有调用of获取该InheritedWidget，
    // 那么这个子widget的`state.didChangeDependencies`方法会被调用
    return this.shareData!= oldWidget.shareData;
  }
}

