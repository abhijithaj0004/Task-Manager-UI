// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/application/tab_provider.dart';
import 'package:taskmanager/presentation/screens/homescreen/home_page.dart';
import 'package:taskmanager/presentation/screens/messagescreen/message_screen.dart';
import 'package:taskmanager/presentation/screens/projectscreen/project_screen.dart';
import 'package:taskmanager/presentation/screens/settingsscreen/settings_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    final PageStorageBucket bucket = PageStorageBucket();
    final List<Widget> screens = [
      HomePage(),
      const ProjectScreen(),
      const MessageScreen(),
      const SettingsScreen(),
    ];
    // Widget currentScreen = HomePage();
    return Scaffold(
      body: PageStorage(bucket: bucket, child: screens[tabProvider.currentTab]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 149, 149, 254),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        tabProvider.setCurrentTab(0);
                      },
                      icon: SvgPicture.asset('assets/icons/home.svg',
                          height: 22,
                          color: tabProvider.currentTab == 0
                              ? const Color.fromARGB(255, 149, 149, 254)
                              : const Color.fromARGB(255, 196, 195, 195)),
                    ),
                    IconButton(
                      onPressed: () {
                        tabProvider.setCurrentTab(1);
                      },
                      icon: SvgPicture.asset('assets/icons/list2.svg',
                          height: 22,
                          color: tabProvider.currentTab == 1
                              ? const Color.fromARGB(255, 149, 149, 254)
                              : const Color.fromARGB(255, 196, 195, 195)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          tabProvider.setCurrentTab(2);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/message.svg',
                          height: 27,
                          color: tabProvider.currentTab == 2
                              ? const Color.fromARGB(255, 149, 149, 254)
                              : const Color.fromARGB(255, 196, 195, 195),
                        )),
                    IconButton(
                        onPressed: () {
                          tabProvider.setCurrentTab(3);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/settings.svg',
                          height: 27,
                          color: tabProvider.currentTab == 3
                              ? const Color.fromARGB(255, 149, 149, 254)
                              : const Color.fromARGB(255, 196, 195, 195),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
