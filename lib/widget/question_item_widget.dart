import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:playing/ui/tab_pages/question/model/question_tag.dart';
import 'package:html/parser.dart';

class QuestionItem extends StatelessWidget {
  final String author;
  final int publishTime;
  final String title;
  final String superChapterName;
  final String desc;
  final List<QuestionTag> tags;

  @required
  final VoidCallback onTap;

  QuestionItem(
    this.author,
    this.publishTime,
    this.title,
    this.superChapterName,
    this.desc,
    this.tags, {
    this.onTap,
  });

  String htmlToText(String html) {
    var document = parse(html);
    String parsedText = parse(document.body.text).documentElement.text;
    String result = parsedText.replaceAll("\n", "").trim();
    return result;
  }

  BoxDecoration textBoxDecoration() {
    return BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Container> tagViews = List();
    for (QuestionTag questionTag in tags) {
      Container container = Container(
        decoration: textBoxDecoration(),
        child: Text(questionTag.name,
        style: TextStyle(fontSize: 12,color: Colors.blue),),
        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
        padding: EdgeInsets.all(2),
      );
      tagViews.add(container);
    }
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(12),
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
                          text: "$superChapterName ",
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 12),
                        ),
                        TextSpan(
                          text: author.isEmpty ? "来自网络" : author,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: Text(
                        DateTime.fromMillisecondsSinceEpoch(publishTime)
                            .toString()
                            .substring(0, 19),
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        textAlign: TextAlign.end),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(color: Colors.black45, fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                htmlToText(desc).trim(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0,5,0,0),
                width: double.infinity,
                child: Wrap(
                  children: tagViews,
                )),
          ],
        ),
      ),
    );
  }
}
