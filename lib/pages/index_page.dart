import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageController _pageController;

  // 声明一个BottomNavigationBarItem 类型的List,并设置文字和图标
  // List<BottomNavigationBarItem> get bottomTabs => [
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      title: Text('分类'),
      icon: Icon(CupertinoIcons.search),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      title: Text('会员'),
      icon: Icon(CupertinoIcons.profile_circled),
    ),
  ];

  // 切换页面类
  final List<Widget> tabBodies = [
    HomePage(),
    CartPage(),
    CategoryPage(),
    MemberPage(),
  ];

  // 负责tabBodies的List索引
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];

    _pageController = new PageController()..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        // 设置底部tap样式
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      // 这里的body children 为总共要展示的地方
      body: IndexedStack(index: currentIndex, children: tabBodies),
    );
  }
}
