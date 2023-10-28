import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/users_list.dart';

class DailyTasksTile extends StatelessWidget {
  const DailyTasksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dailyTaskList = HomeModels();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true, // Ensure the ListView takes only the necessary height
      itemCount: dailyTaskList.dailyTaskList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    dailyTaskList.dailyTaskList[index]['persent'] == 1.0
                        ? Icons.check_circle
                        : Icons.check_circle_outline,
                    color: dailyTaskList.dailyTaskList[index]['persent'] == 1.0
                        ? dailyTaskList.dailyTaskList[index]['color']
                        : Colors.grey,
                    size: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          dailyTaskList.dailyTaskList[index]['name'],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      kHeight10,
                      LinearPercentIndicator(
                        lineHeight: 10,
                        width: 200,
                        backgroundColor: const Color.fromARGB(255, 237, 241, 249),
                        progressColor: dailyTaskList.dailyTaskList[index]
                            ['color'],
                        percent: dailyTaskList.dailyTaskList[index]['persent'],
                        animation: true,
                        animationDuration: Duration.secondsPerHour,
                        barRadius: const Radius.circular(20),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: UsersList(
                      radius: 15,
                      dailyTaskList: dailyTaskList,
                      index: index,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                    size: 20,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
