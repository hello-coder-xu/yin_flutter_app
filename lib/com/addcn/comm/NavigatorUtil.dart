import 'package:flutter/material.dart';
import 'package:flutter_app/com/addcn/comm/Application.dart';
import 'package:flutter_app/com/addcn/comm/Common.dart';

class NavigatorUtil {
  /// 返回
  static void goBack(BuildContext context, {result}) {
    Application.router.pop(context, result: result);
  }

  /// 跳转页面
  static Future navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    dynamic parameters,
    Duration transitionDuration = const Duration(milliseconds: 300),
    TransitionType transition,
  }) {
    return Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        parameters: parameters,
        transitionDuration: transitionDuration,
        transition: transition);
  }
}
