import 'package:flutter_app/com/addcn/comm/RouteHandle.dart';
import 'package:flutter_app/com/addcn/comm/Router.dart';

class Routes {
  static String root = "/";
  static String textViewPage = "/textViewPage";
  static String textFieldPage = "/textFieldPage";
  static String formPage = "/formPage";
  static String buttonPage = "/buttonPage";
  static String imagePage = "/imagePage";
  static String appBarPage = "/appBarPage";
  static String tabPage = "/tabPage";
  static String radioPage = "/radioPage";
  static String checkPage = "/checkPage";
  static String switchPage = "/switchPage";
  static String chipPage = "/chipPage";
  static String dividerPage = "/dividerPage";
  static String progressPage = "/progressPage";
  static String pageViewPage = "/pageViewPage";
  static String listViewPage = "/listViewPage";

  static void configureRoutes(Router router) {
    router.define(root, handler: rootHandler);
    router.define(textViewPage, handler: textViewPageHandler);
    router.define(textFieldPage, handler: textFieldPageHandler);
    router.define(formPage, handler: formPageHandler);
    router.define(buttonPage, handler: buttonPageHandler);
    router.define(imagePage, handler: imagePageHandler);
    router.define(appBarPage, handler: appBarPageHandler);
    router.define(tabPage, handler: tabPageHandler);
    router.define(radioPage, handler: radioPageHandler);
    router.define(checkPage, handler: checkPageHandler);
    router.define(switchPage, handler: switchPageHandler);
    router.define(chipPage, handler: chipPageHandler);
    router.define(dividerPage, handler: dividerPageHandler);
    router.define(progressPage, handler: progressPageHandler);
    router.define(pageViewPage, handler: pageViewPageHandler);
    router.define(listViewPage, handler: listViewPageHandler);
  }
}
