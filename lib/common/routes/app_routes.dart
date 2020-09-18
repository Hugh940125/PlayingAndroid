import 'package:flutter/cupertino.dart';
import 'package:playing/ui/main_page/main_page.dart';
import 'package:playing/ui/splash/splash_page.dart';
import 'package:playing/ui/webview_page/webview_page.dart';

class AppRouter{
  static const String splashPage = "/splash_page";
  static const String mainPage = "/main_page";
  static const String webviewPage = "/webview_page";

  static Map<String, WidgetBuilder> routes = {
    splashPage:(context) => SplashPage(),
    mainPage:(context) => MainPage(),
    webviewPage:(context) => WebViewPage(),
  };
}