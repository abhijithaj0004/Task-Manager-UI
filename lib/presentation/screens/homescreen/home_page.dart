import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/daily_tasks_list.dart';

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
            SvgPicture.asset(
              'assets/icons/search.svg',
              // ignore: deprecated_member_use
              color: const Color.fromARGB(255, 135, 135, 135),
            ),
          ],
        ),
        // actions: [

        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // kHeight20,
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight20,
                    SizedBox(
                      height: 300,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: homeModel.dashBoardlist[index]['color'],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                homeModel.dashBoardlist[index]['icon'],
                                kHeight20,
                                Text(
                                  homeModel.dashBoardlist[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: homeModel.dashBoardlist.length,
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
