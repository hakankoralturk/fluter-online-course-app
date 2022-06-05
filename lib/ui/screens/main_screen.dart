import 'package:flutter/material.dart';
import 'package:online_course_app/ui/screens/home_screen.dart';
import 'package:online_course_app/ui/theme/colors.dart';
import 'package:online_course_app/constants/app_constants.dart';
import 'package:online_course_app/ui/widgets/bottom_bar_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activePageIndex = 0;

  List tabItems = [
    {
      "icon": AppConstants.bottomBarIcon_01,
      "page": const HomeScreen(),
    },
    {
      "icon": AppConstants.bottomBarIcon_02,
      "page": Container(
        child: Center(
          child: Text("Search"),
        ),
      )
    },
    {
      "icon": AppConstants.bottomBarIcon_03,
      "page": Container(
        child: Center(
          child: Text("Play"),
        ),
      )
    },
    {
      "icon": AppConstants.bottomBarIcon_04,
      "page": Container(
        child: Center(
          child: Text("Chat"),
        ),
      )
    },
    {
      "icon": AppConstants.bottomBarIcon_05,
      "page": Container(
        child: Center(
          child: Text("Profile"),
        ),
      )
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: activePageIndex,
      children:
          List.generate(tabItems.length, (index) => tabItems[index]["page"]),
    );
  }

  Widget buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            tabItems.length,
            (index) => bottomBarItem(
              isActive: activePageIndex == index,
              icon: tabItems[index]["icon"],
              onTap: () {
                onPageIndexChanged(index);
              },
            ),
          )),
    );
  }

  onPageIndexChanged(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}
