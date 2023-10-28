import 'package:flutter/material.dart';

class HomeModels {
  final List<Color> colors = [
    const Color.fromARGB(187, 255, 185, 86),
    const Color.fromARGB(161, 123, 133, 249),
    const Color.fromARGB(120, 149, 246, 70),
    const Color.fromARGB(225, 249, 126, 64)
  ];
  final List<Map<String, dynamic>> dashBoardlist = [
    {
      'name': 'In Progress',
      'color': const Color.fromARGB(187, 255, 185, 86),
      'icon': const Icon(
        Icons.timer_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Ongoing',
      'color': const Color.fromARGB(161, 123, 133, 249),
      'icon': const Icon(
        Icons.shuffle_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Completed',
      'color': const Color.fromARGB(120, 149, 246, 70),
      'icon': const Icon(
        Icons.check_box_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Cancel',
      'color': const Color.fromARGB(225, 249, 126, 64),
      'icon': const Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 30,
      )
    }
  ];
  final List<Map<String, dynamic>> dailyTaskList = [
    {
      'name': 'App Animation',
      'color': const Color.fromARGB(161, 123, 133, 249),
      'persent': 0.7,
      'users': [
        'assets/images/persongrey.jpeg',
        'assets/images/persongrey2.jpeg',
        'assets/images/pexels-pixabay-220453.jpg',
      ],
    },
    {
      'name': 'DashBoard Design',
      'color': const Color.fromARGB(120, 149, 246, 70),
      'persent': 1.0,
      'users': [
        'assets/images/persongrey2.jpeg',
        'assets/images/pexels-pixabay-220453.jpg',
        'assets/images/persongrey.jpeg',
      ],
    },
    {
      'name': 'UI/UX Design',
      'color': const Color.fromARGB(160, 249, 126, 64),
      'persent': 0.5,
      'users': [
        'assets/images/pexels-pixabay-220453.jpg',
        'assets/images/persongrey.jpeg',
        'assets/images/persongrey3.jpeg',
      ],
    }
  ];
}
