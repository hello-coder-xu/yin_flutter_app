import 'package:flutter/material.dart';

class AppRoute {
  String route;
  dynamic handler;
  TransitionType transitionType;

  AppRoute(this.route, this.handler, {this.transitionType});
}

enum TransitionType {
  native,
  nativeModal,
  inFromLeft,
  inFromRight,
  inFromBottom,
  fadeIn,
  custom,
  cupertino,
  cupertinoFullScreenDialog,
}

enum HandlerType {
  route,
  function,
}

typedef Widget HandlerFunc(BuildContext context, Map parameters);

class Handler {
  Handler({this.type = HandlerType.route, this.handlerFunc});

  final HandlerType type;
  final HandlerFunc handlerFunc;
}
