import 'package:flutter/material.dart';

enum TabItem { red, green, blue }

class TabHelper {
  //GET ITEM

  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.red;
      case 1:
        return TabItem.green;
      case 2:
        return TabItem.blue;
    }
    return TabItem.red;
  }

  //GET COLOR NAME
  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return 'red';
      case TabItem.green:
        return 'green';
      case TabItem.blue:
        return 'blue';
      default:
        return '';
    }
  }

//GET COLOR

  static MaterialColor color(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.red:
        return Colors.red;
      case TabItem.green:
        return Colors.green;
      case TabItem.blue:
        return Colors.blue;
    }
    return Colors.grey;
  }

  //GET ICON DATA
  static IconData icon(TabItem tabItem) {
    return Icons.layers;
  }
}
