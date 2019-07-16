import 'package:flutter/widgets.dart';

typedef String ScreenNameExtractor(RouteSettings settings);

String defaultNameExtractor(RouteSettings settings) => settings.name;

class MyObserver extends RouteObserver<PageRoute<dynamic>> {
  MyObserver({
    this.nameExtractor = defaultNameExtractor,
  });

  final ScreenNameExtractor nameExtractor;

  void _sendScreenView(PageRoute<dynamic> route) {
    final String screenName = nameExtractor(route.settings);
    print('test name=${route.settings.name}');
    print('test screenName=$screenName');
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
      final String screenName = nameExtractor(route.settings);
      print('test pop screenName=$screenName');
    }
  }
}
