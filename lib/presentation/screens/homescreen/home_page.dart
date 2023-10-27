import 'package:flutter/material.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/dailyTasksList.dart';

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
          // crossAxisAlignment:
          //     CrossAxisAlignment.center, // Center the child widgets
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: const Color.fromARGB(255, 232, 228, 250),
              child: Image.asset(
                'assets/images/Modified-Bitmoji.png',
                height: 45,
              ),
            ),
            Icon(
              Icons.search_outlined,
              color: Colors.grey,
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
            physics: BouncingScrollPhysics(),
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
                    const Text(
                      'Alex Marconi',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    kHeight20,
                    SizedBox(
                      height: 300,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: homeModel.dashBoardlist.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Daily Task',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
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
                    DailyTasksTile(),
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
