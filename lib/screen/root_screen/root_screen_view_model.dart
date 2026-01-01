import 'package:flutter/widgets.dart';
import 'package:test_now/core/base_view_model/base_view_model.dart';
import 'package:test_now/core/constant/app_assets.dart';
import 'package:test_now/screen/chat/chat_screen.dart';
import 'package:test_now/screen/contacts/contact_screen.dart';
import 'package:test_now/screen/profile/profile_screen.dart';
import 'package:test_now/screen/tests/test_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootScreenViewModel extends BaseViewModel {
  List<Widget> screens = [
    TestScreen(),
    ContactScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  // Tab Data for the BottomBar
  List<BottomBarItem> items = [
    BottomBarItem(AppAssets().testIcon, 'Tests'),
    BottomBarItem(AppAssets().contactIcon, 'Contacts'),
    BottomBarItem(AppAssets().chatIcon, 'Chat'),
    BottomBarItem(AppAssets().profileIcon, 'Profile'),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}


class BottomBarItem {
  final String icon;
  final String label;

  BottomBarItem(this.icon, this.label);
}
