import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/pages/dashboardpage/dashboard_page.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/users_list.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/dailyTasksList.dart';
import 'package:taskmanager/presentation/screens/projectscreen/widgets/models/project_models.dart';
import 'package:taskmanager/presentation/screens/projectscreen/widgets/users_list.dart';

class AllProjectsList extends StatelessWidget {
  AllProjectsList({super.key});
  final dailyTaskTile = HomeModels();
  final projectModels = ProjectModels();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DashBoardPage(
                date: projectModels.dailyTaskList[index]['date'],
                index: index,
                colors: projectModels.dailyTaskList[index]['color'],
                persent: projectModels.dailyTaskList[index]['persent'],
                persentageTxt: projectModels.dailyTaskList[index]
                    ['presentagetext'],
                subTitle: projectModels.dailyTaskList[index]['subtitle'],
                title: projectModels.dailyTaskList[index]['name'],
              ),
            ));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectModels.dailyTaskList[index]['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    kHeight10,
                    Text(
                      projectModels.dailyTaskList[index]['subtitle'],
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    kHeight20,
                    Text('Team'),
                    kHeight10,
                    SizedBox(
                      width: 100,
                      child: UsersListProject(
                        index: index,
                      ),
                    ),
                    kHeight20,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                        ),
                        kWidth10,
                        Text(
                          projectModels.dailyTaskList[index]['date'],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                CircularPercentIndicator(
                  backgroundColor: Color.fromARGB(255, 240, 243, 253),
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 8,
                  animation: true,
                  animationDuration: Duration.secondsPerHour,
                  radius: 43,
                  percent: projectModels.dailyTaskList[index]['persent'],
                  progressColor: projectModels.dailyTaskList[index]['color'],
                  center: Text(
                    projectModels.dailyTaskList[index]['presentagetext'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
