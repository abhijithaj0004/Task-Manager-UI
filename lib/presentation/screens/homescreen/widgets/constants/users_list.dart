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
          backgroundColor: Colors.blue,
        ),
        Positioned(
          left: 16,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][2]),
            radius: radius,
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          left: 35,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][0]),
            radius: radius,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}
