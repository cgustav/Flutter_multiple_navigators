import 'package:flutter/material.dart';

//locales

//helpers
import './helpers/tabHelper.dart';
import './shared/bottomNavigator.dart';
import './shared/tabNavigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
  };

  TabItem currentTab = TabItem.red;

  void _selectTab(TabItem tabItem) {
    setState(() => currentTab = tabItem);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(TabItem.red),
            _buildOffstageNavigator(TabItem.green),
            _buildOffstageNavigator(TabItem.blue),
            // Container(
            //   child: Center(
            //     child: Text('WenaCTM'),
            //   ),
            // )
          ],
        ),
        bottomNavigationBar: BottomNavigator(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
  //BottomNai
  // _buildBody() {
  //   return Container(
  //     color: Colors.red,
  //     alignment: Alignment.center,
  //     child: FlatButton(
  //       child: Text(
  //         'PUSH',
  //         style: TextStyle(fontSize: 32, color: Colors.white),
  //       ),
  //       onPressed: _push,
  //     ),
  //   );
  // }

  // _push() {
  //   //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColorDetailPage()));
  // }
}
