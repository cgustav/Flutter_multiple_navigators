import 'package:flutter/material.dart';

//helper
import '../helpers/tabHelper.dart';

//enum TabItem { red, green, blue }

// class BottomNavigator extends StatefulWidget {
//   final TabItem currentTab;
//   final ValueChanged<TabItem> onSelectTab;

//   BottomNavigator({this.currentTab, this.onSelectTab});

//   @override
//   State<StatefulWidget> createState() {
//     return _BottomNavigatorState();
//   }
// }

// class _BottomNavigatorState extends State<BottomNavigator> {

class BottomNavigator extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomNavigator({this.currentTab, this.onSelectTab});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //currentIndex: _currentIndex,
      items: [
        _buildItem(tabItem: TabItem.red),
        _buildItem(tabItem: TabItem.green),
        _buildItem(tabItem: TabItem.blue),
      ],
      onTap: (index) {
        //widget.onSelectTab(TabHelper.item(index: index));
        onSelectTab(TabHelper.item(index: index));
      },
    );
  }

  //HELPERS
  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    final String text = TabHelper.description(tabItem);
    final IconData icon = TabHelper.icon(tabItem);

    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _colorTabMatching(item: tabItem),
        ),
        title: Text(text,
            style: TextStyle(color: _colorTabMatching(item: tabItem))));
  }

  //UTILS
  Color _colorTabMatching({TabItem item}) {
    //return widget.currentTab == item ? TabHelper.color(item) : Colors.grey;
    return currentTab == item ? TabHelper.color(item) : Colors.grey;
  }
}
