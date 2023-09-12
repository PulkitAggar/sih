import 'package:firebase_signin/screens/home_screen.dart';
import 'package:firebase_signin/screens/signin_screen.dart';
import 'package:firebase_signin/utils/widget_extensions.dart';
import 'package:flutter/material.dart';

const bmPrimaryColor = Color(0xff515151);

class DashboardTwo extends StatefulWidget {
  @override
  State<DashboardTwo> createState() => _DashboardTwoState();
}

class _DashboardTwoState extends State<DashboardTwo> {
  List<DashboardModel> list = getDashboardList();

  int selectedTab = 0;

  void updateSelectedTab(int newSelectedTab) {
    // Update the selected tab value
    selectedTab = newSelectedTab;
    setState(() {});
  }

  Widget getFragment() {
    if (selectedTab == 0) {
      return HomeScreen();
    } else {
      return SignInScreen();
    }
  }

  @override
  void dispose() {
    // if (widget.flag) {
    //   setStatusBarColor(appStore.isDarkModeOn ? appStore.scaffoldBackground! : bmLightScaffoldBackgroundColor);
    // } else {
    //   setStatusBarColor(Colors.transparent);
    // }

    super.dispose();
  }

  Color getDashboardColor() {
    const bmLightScaffoldBackgroundColor = Color(0xfff7f5f9);
    return bmLightScaffoldBackgroundColor;

    // if (!appStore.isDarkModeOn) {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorLight;
    //   } else {
    //     return bmLightScaffoldBackgroundColor;
    //   }
    // } else {
    //   if (selectedTab == 1 || selectedTab == 2 || selectedTab == 3) {
    //     return bmSecondBackgroundColorDark;
    //   } else {
    //     return appStore.scaffoldBackground!;
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getDashboardColor(),
      body: getFragment(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: bmPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedTab,
        items: list.map((e) {
          int index = list.indexOf(e);
          return BottomNavigationBarItem(
            icon: Icon(e.unSelectedIcon, color: bmPrimaryColor),
            activeIcon: index == 0
                ? Icon(e.selectedIcon, color: bmPrimaryColor)
                : Icon(e.selectedIcon, color: bmPrimaryColor),
            label: '',
          );
        }).toList(),
      ).cornerRadiusWithClipRRectOnly(topLeft: 32, topRight: 32),
    );
  }
}

class DashboardModel {
  IconData selectedIcon;
  IconData unSelectedIcon;

  DashboardModel({required this.selectedIcon, required this.unSelectedIcon});
}

List<DashboardModel> getDashboardList() {
  List<DashboardModel> list = [];

  list.add(DashboardModel(
      selectedIcon: Icons.home_filled, unSelectedIcon: Icons.home_outlined));
  list.add(DashboardModel(
      selectedIcon: Icons.health_and_safety,
      unSelectedIcon: Icons.health_and_safety_outlined));
  return list;
}
