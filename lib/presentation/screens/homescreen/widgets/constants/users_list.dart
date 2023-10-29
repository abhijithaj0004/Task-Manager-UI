import 'package:flutter/material.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.dailyTaskList,
    required this.index, required this.radius,
  });

  final HomeModels dailyTaskList;
  final int index;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage:
              AssetImage(dailyTaskList.dailyTaskList[index]['users'][1]),
          radius: radius,
          backgroundColor: Color.fromARGB(81, 182, 87, 255),
        ),
        Positioned(
          left: 16,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][2]),
            radius: radius,
            backgroundColor: Color.fromARGB(69, 250, 163, 64),
          ),
        ),
        Positioned(
          left: 35,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][0]),
            radius: radius,
            backgroundColor: Color.fromARGB(106, 111, 244, 54),
          ),
        ),
      ],
    );
  }
}
