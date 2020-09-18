import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playing/ui/tab_pages/home/home_page.dart';
import 'package:playing/ui/tab_pages/me/me_page.dart';
import 'package:playing/ui/tab_pages/question/question_page.dart';
import 'package:playing/ui/tab_pages/system/system_page.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => MainPageState();
}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  int _currentIndex = 0;
  List<String> _tabs = ['首页','问答','体系','我的'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: [
            HomePage(),
            QuestionPage(),
            SystemPage(),
            MePage()
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
            child:TabBar(
                isScrollable:false,
                indicatorColor: Colors.transparent,
                onTap: (int index){
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: _tabController,
                tabs: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: _currentIndex == 0?Image.asset('images/ic_home_checked.png',width: 20,height: 20,):Image.asset('images/ic_home_unchecked.png',width: 20,height: 20,),
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                      ),
                      Text(
                        _tabs[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(color:_currentIndex == 0?const Color(0xFF3945D8):const Color(0xFFDBDBDB)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: _currentIndex == 1?Image.asset('images/ic_question_checked.png',width: 20,height: 20,):Image.asset('images/ic_question_unchecked.png',width: 20,height: 20,),
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                      ),
                      Text(
                        _tabs[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(color:_currentIndex == 1?const Color(0xFF3945D8):const Color(0xFFDBDBDB)),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: _currentIndex == 2?Image.asset('images/ic_system_checked.png',width: 20,height: 20,):Image.asset('images/ic_system_unchecked.png',width: 20,height: 20,),
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                      ),
                      Text(
                        _tabs[2],
                        textAlign: TextAlign.center,
                        style: TextStyle(color:_currentIndex == 2?const Color(0xFF3945D8):const Color(0xFFDBDBDB)),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        child: Container(
                          alignment: Alignment.center,
                          child: _currentIndex == 3?Image.asset('images/ic_me_checked.png',width: 20,height: 20,):Image.asset('images/ic_me_unchecked.png',width: 20,height: 20,),
                          margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                      ),
                      Text(
                        _tabs[3],
                        textAlign: TextAlign.center,
                        style: TextStyle(color:_currentIndex == 3?const Color(0xFF3945D8):const Color(0xFFDBDBDB)),
                      ),
                    ],
                  )
                ])
        ),
      );
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
}