import 'package:flutter/material.dart';
import 'package:talker/pages/bar/focus_page.dart';
import 'package:talker/pages/bar/recommend_page.dart';
import 'package:talker/res/index.dart';

class BarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _allPages.length,
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                title: new BarTabLayout(),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              preferredSize: Size.fromHeight(45)
          ),
          body: new BarTabBarViewLayout(),
        )
    );
  }
}

class _Page {
  final String labelId;
  _Page(this.labelId);
}

List<_Page> _allPages = [
  new _Page(BarIds.tab_focus),
  new _Page(BarIds.tab_recommend),
];

class BarTabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.orange,
      indicatorWeight: 4,
      labelColor: Colors.black87,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,),
      tabs: _allPages.map((_Page page) =>
        new Tab(text: BarIds.tabMaps[page.labelId])
      ).toList(),
    );
  }
}

class BarTabBarViewLayout extends StatelessWidget {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
    switch (labelId) {
      case BarIds.tab_focus:
        return FocusPage();
        break;
      case BarIds.tab_recommend:
        return RecommendPage();
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: _allPages.map((_Page page) {
        return buildTabView(context, page);
      }).toList()
    );
  }
}
