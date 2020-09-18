import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppBar {
  final String title;
  final bool canBack;
  final String heroTag;
  //final Widget leading;

  CommonAppBar(this.title, this.heroTag,{this.canBack = false});

  PreferredSizeWidget build(BuildContext context) {
    return CupertinoNavigationBar(
      heroTag: heroTag,
      transitionBetweenRoutes: false,
      middle: Text(title,style: TextStyle(color: Colors.black45,fontSize: 18),),
      leading: canBack?IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black45,),
      onPressed: (){
        Navigator.pop(context);
      },):null,
      automaticallyImplyLeading: canBack,
      //leading: leading,
    );
  }
}
