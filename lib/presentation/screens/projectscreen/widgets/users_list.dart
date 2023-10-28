import 'package:flutter/material.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';

class UsersListProject extends StatelessWidget {
  UsersListProject({super.key, required this.index});
  final dailyTaskList = HomeModels();
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage:
              AssetImage(dailyTaskList.dailyTaskList[index]['users'][1]),
          radius: 15,
          backgroundColor: Colors.blue,
        ),
        Positioned(
          left: 16,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][2]),
            radius: 15,
            backgroundColor: Colors.black,
          ),
        ),
        Positioned(
          left: 35,
          child: CircleAvatar(
            backgroundImage:
                AssetImage(dailyTaskList.dailyTaskList[index]['users'][0]),
            radius: 15,
            backgroundColor: Colors.red,
          ),
        ),
        const Positioned(
          left: 45,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Color.fromARGB(253, 249, 190, 102),
            child: Center(
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
