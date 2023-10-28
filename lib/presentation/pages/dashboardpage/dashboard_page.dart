import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/pages/dashboardpage/widgets/chart.dart';
import 'package:taskmanager/presentation/pages/dashboardpage/widgets/project_progress_checkbox.dart';
import 'package:taskmanager/presentation/screens/projectscreen/widgets/users_list.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.persentageTxt,
      required this.persent,
      required this.colors,
      required this.index,
      required this.date});
  final String title;
  final String subTitle;
  final String persentageTxt;
  final double persent;
  final Color colors;
  final int index;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  kHeight10,
                  Text(
                    subTitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  kHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircularPercentIndicator(
                        backgroundColor:
                            const Color.fromARGB(255, 240, 243, 253),
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        animationDuration: Duration.secondsPerHour,
                        radius: 55,
                        percent: persent,
                        progressColor: colors,
                        center: Text(
                          persentageTxt,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Team',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          kHeight10,
                          SizedBox(
                              width: 100,
                              child: UsersListProject(index: index)),
                          kHeight10,
                          const Text(
                            'Deadline',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          kHeight10,
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.grey,
                              ),
                              kWidth10,
                              Text(
                                date,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Project Progress',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  kHeight20,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      children: [
                        ProjectProgressCheckbox(
                          title: 'Create user flow',
                          isCompleted: true,
                        ),
                        ProjectProgressCheckbox(
                          title: 'Create wireframe',
                          isCompleted: true,
                        ),
                        ProjectProgressCheckbox(
                          title: 'Transform to visual design',
                          isCompleted: false,
                        )
                      ],
                    ),
                  ),
                  kHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Project Overview',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text(
                          'Weekly',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        items: const [],
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  kHeight20,
                  Chart()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
