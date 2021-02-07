import 'dart:ui';
import 'package:appaler_cookieman/Icons/IconsSVG.dart';
import 'package:appaler_cookieman/Model/TabIconData.dart';
import 'package:appaler_cookieman/Screens/InsightPage.dart';
import 'package:appaler_cookieman/Widgets/NavigationBottomBar.dart';
import 'package:appaler_cookieman/cities.dart';
import 'package:appaler_cookieman/foods.dart';
import 'package:appaler_cookieman/general.dart';
import 'package:appaler_cookieman/health.dart';
import 'package:appaler_cookieman/professions.dart';
import 'package:appaler_cookieman/sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  AnimationController animationController;

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Rescue The Cookie Man",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "You can play this game by choosing a category\n"
                      "",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitiesPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(icon_Bills),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Cities",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFF8A40)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodsPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(foods),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Foods",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFBD6EF5)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HealthPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(health),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Health",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFF4B4B)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfessionPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(engineering),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Jobs",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF239DF3)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SportsPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(sports),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Sports",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF3DEB34)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 32,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GeneralPage()),
                                );
                              },
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Color(0xff8E8FC9).withOpacity(0.3)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(general),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "General",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEB34AE)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomBar()
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
              });
            } else if (index == 1 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
              });
            }
          },
        ),
      ],
    );
  }
}
