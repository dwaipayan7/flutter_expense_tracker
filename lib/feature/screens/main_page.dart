import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/cors/utils/color.dart';

import 'home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;
  final PageStorageBucket _pageStorageBucket = PageStorageBucket();
  
  final List<Widget> _tabs = [

    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),

  ];

  void onTabSelected(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray,
      body: Stack(
        children: [
          PageStorage(bucket: _pageStorageBucket, child: _tabs[selectedIndex]),
          SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset("assets/img/bottom_bar_bg.png"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTabIcon(
                              iconPath: "assets/img/home.png",
                              index: 0
                          ),
                          _buildTabIcon(
                              iconPath: "assets/img/budgets.png",
                              index: 1
                          ),
                          SizedBox(width: 50, height: 50,),
                          _buildTabIcon(
                              iconPath: "assets/img/calendar.png",
                              index: 2
                          ),
                          _buildTabIcon(
                              iconPath: "assets/img/creditcards.png",
                              index: 3
                          )
                        ],
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Image.asset("assets/img/center_btn.png",
                          height: 55,
                            width: 55,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  IconButton _buildTabIcon({required String iconPath, required int index}) => IconButton(
      onPressed: () => onTabSelected(index),
      icon: Image.asset(iconPath,
      height: 23,
        width: 23,
        color: selectedIndex == index? Colors.white : gray30,
      )
  );
}
