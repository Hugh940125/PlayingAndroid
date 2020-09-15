import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppBar {
  final String title;
  final bool canBack;
  //final Widget leading;

  CommonAppBar(this.title, {this.canBack = true});

  PreferredSizeWidget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
      automaticallyImplyLeading: canBack,
      //leading: leading,
    );
  }
}
