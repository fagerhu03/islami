import 'package:flutter/material.dart';
import 'package:islami/home/tabs/date_tab.dart';
import 'package:islami/home/tabs/hadeth_tab.dart';
import 'package:islami/home/tabs/quran_tab.dart';
import 'package:islami/home/tabs/radio_tab.dart';
import 'package:islami/home/tabs/sebha_tab.dart';
import 'package:islami/thems/app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${getBackgroundImageScreen()}.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          backgroundColor: AppColors.textPrimary,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.background,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavItem("quran_icon", 0),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("hadeth_icon", 1),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("sebha_icon", 2),
              label: "Sebha",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("radio_icon", 3),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("date_icon", 4),
              label: "Date",
            ),
          ],
        ),
        body: Column(
          children: [
            Image.asset("assets/images/welcom_images/onboarding_header.png",alignment: Alignment.topCenter,),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }


  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    DateTab(),
  ];

  String getBackgroundImageScreen() {
    switch (currentIndex) {
      case 0:
        return "home_bg";
      case 1:
        return "hadeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "date_bg";
      default:
        return "home_bg";
    }
  }

  Widget _buildNavItem(String imageName, int index) {
    return currentIndex == index
        ? Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 22, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(66),
        color: Color(0x99202020),
      ),
      child: ImageIcon(AssetImage("assets/icons/$imageName.png")),
    )
        : ImageIcon(AssetImage("assets/icons/$imageName.png"));
  }
}
