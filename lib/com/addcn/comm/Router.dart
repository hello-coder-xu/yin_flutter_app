/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2019 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/com/addcn/comm/Common.dart';

class Router {
  final Map<String, Handler> _map = new Map();

  void define(String routePath, {@required Handler handler}) {
    _map[routePath] = handler;
  }

  bool pop(BuildContext context, {result}) => Navigator.pop(context, result);

  ///页面跳转
  Future navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    dynamic parameters,
    Duration transitionDuration = const Duration(milliseconds: 300),
    TransitionType transition,
  }) {
    Completer completer = new Completer();
    Future future = completer.future;
    Handler handler = _map[path];
    String name = "";
    if (path.startsWith("/")) {
      name = path.substring(1);
    }
    RouteSettings routeSettings = RouteSettings(name: name);

    Route route = getRoute(
        routeSettings: routeSettings,
        handler: handler,
        parameters: parameters,
        transitionDuration: transitionDuration,
        transitionType: transition);

    if (clearStack) {
      future = Navigator.pushAndRemoveUntil(context, route, (check) => false);
    } else {
      future = replace ? Navigator.pushReplacement(context, route) : Navigator.push(context, route);
    }
    completer.complete();

    return future;
  }

  Route<dynamic> getRoute({
    RouteSettings routeSettings,
    Handler handler,
    dynamic parameters,
    TransitionType transitionType,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    if (Platform.isIOS) {
      return new CupertinoPageRoute<dynamic>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return handler.handlerFunc(context, parameters);
          });
    } else {
      var routeTransitionsBuilder = _standardTransitionsBuilder(transitionType);
      return new PageRouteBuilder<dynamic>(
        settings: routeSettings,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return handler.handlerFunc(context, parameters);
        },
        transitionDuration: transitionDuration,
        transitionsBuilder: routeTransitionsBuilder,
      );
    }
  }

  RouteTransitionsBuilder _standardTransitionsBuilder(TransitionType transitionType) {
    return (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == TransitionType.fadeIn) {
        return new FadeTransition(opacity: animation, child: child);
      } else {
        const Offset topLeft = const Offset(0.0, 0.0);
        const Offset topRight = const Offset(1.0, 0.0);
        const Offset bottomLeft = const Offset(0.0, 1.0);
        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == TransitionType.inFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromRight) {
          startOffset = topRight;
          endOffset = topLeft;
        }

        return new SlideTransition(
          position: new Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }
}
