import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/daily_tasks_list.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/dash_board_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeModel = HomeModels();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                radius: 27,
                backgroundColor: const Color.fromARGB(255, 232, 228, 250),
                child: FirebaseAuth.instance.currentUser!.photoURL == null
                    ? Image.asset(
                        'assets/images/Modified-Bitmoji.png',
                        height: 45,
                      )
                    : Image.network(
                        FirebaseAuth.instance.currentUser!.photoURL ?? '',
                        height: 50,
                      )),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    // ignore: deprecated_member_use
                    color: const Color.fromARGB(255, 135, 135, 135),
                  ),
                ),
                kWidth20,
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Are you sure?'),
                        content: const Text('Do you want to logOut?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'LogOut',
                              style: TextStyle(
                                  color: Color.fromARGB(161, 119, 61, 255)),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Color.fromARGB(161, 119, 61, 255)),
                              ))
                        ],
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.logout,
                    size: 27,
                    color: Color.fromARGB(255, 129, 127, 127),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight10,
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName ?? "User",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight20,
                    SizedBox(
                      height: 300,
                      child: DashboardList(
                        homeModel: homeModel,
                        ontap: () {},
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daily Task',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'All Task',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    kHeight20,
                    const DailyTasksTile(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
