import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ArticleItem extends StatelessWidget {
  final bool fresh;
  final String author;
  final int time;
  final String title;
  final String superChapterName;
  @required
  final VoidCallback onTap;

  ArticleItem(
      this.fresh, this.author, this.time, this.title, this.superChapterName,
      {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: fresh ? "新" : "",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 12),
                        ),
                        TextSpan(
                          text: author.isEmpty ? "来自网络" : author,
                          style: TextStyle(color: Colors.black26, fontSize: 12),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Text(
                        DateTime.fromMillisecondsSinceEpoch(time)
                            .toString()
                            .substring(0, 19),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(color: Colors.grey, fontSize: 15),
                maxLines: 1,
              ),
            ),
            Container(
                width: double.infinity,
                child: Text(superChapterName,
                    style: TextStyle(color: Colors.grey, fontSize: 12))),
          ],
        ),
      ),
    );
  }
}
