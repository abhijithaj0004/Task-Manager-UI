import 'package:flutter/material.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/projectscreen/widgets/all_projects_list.dart';

class ProjectScreen extends StatelessWidget {
  ProjectScreen({super.key});
  // final tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Project',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight30,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(161, 123, 133, 249),
                  ),
                  tabs: [
                    Tab(
                      child: Text('All'),
                    ),
                    Tab(
                      child: Text('Ongoing'),
                    ),
                    Tab(
                      child: Text('Completed'),
                    )
                  ],
                ),
              ),
              kHeight20,
              Expanded(
                child: TabBarView(
                    // controller: tabController,
                    children: [
                      AllProjectsList(),
                      // Text('kkk'),
                      Center(child: Text('Ongoing')),
                      Center(child: Text('Completed')),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
