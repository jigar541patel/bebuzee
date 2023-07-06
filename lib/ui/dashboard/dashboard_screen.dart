import 'package:bebuzee/ui/dashboard/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors_utils.dart';
import '../../utils/images_utils.dart';
import '../../utils/standard_regular_text.dart';
import 'home_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DashBoard> {
  int currentTab =
      0; // to keep track of active tab index// to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          // setState(() {
          //   currentScreen =
          //       AddPrescriptionPage(); // if user taps on this dashboard tab will be active
          //   currentTab = 2;
          // });
        },
        child: SvgPicture.asset(
          homeMenuIcon,
          height: 24,
          width: 28,
          color: whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        child: BottomAppBar(
          color: whiteColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentScreen =
                                  const HomePage(); // if user taps on this dashboard tab will be active
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                homeMenuIcon,
                                height: 24,
                                width: 24,
                                color: currentTab == 0
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              StandardCustomText(
                                label: 'Home Feed',
                                fontSize: 10.0,
                                color: currentTab == 0
                                    ? primaryColor
                                    : Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                // Right Tab bar icons
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentScreen =
                                  MyProfileScreen(); // if user taps on this dashboard tab will be active
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                userIcon,
                                height: 24,
                                width: 24,
                                color: currentTab == 1
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              StandardCustomText(
                                label: 'Profile',
                                fontSize: 10.0,
                                color: currentTab == 0
                                    ? primaryColor
                                    : Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
