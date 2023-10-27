import 'package:flutter/material.dart';

class ProjectModels {
  final List<Map<String, dynamic>> dailyTaskList = [
    {
      'name': 'App Animation',
      'color': const Color.fromARGB(161, 123, 133, 249),
      'persent': 0.65,
      'users': [
        'assets/images/persongrey.jpeg',
        'assets/images/persongrey2.jpeg',
        'assets/images/pexels-pixabay-220453.jpg',
      ],
      'subtitle': 'Today, Shared by-Unbox Digital',
      'date': 'June 15, 2021-June 22, 2021',
      'presentagetext': '65%'
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
      'subtitle': 'Today, Shared by-Ui Been',
      'date': 'June 25, 2021-June 30, 2021',
      'presentagetext': '100%'
    },
    {
      'name': 'UI/UX Design',
      'color': const Color.fromARGB(160, 249, 126, 64),
      'persent': 0.3,
      'users': [
        'assets/images/pexels-pixabay-220453.jpg',
        'assets/images/persongrey.jpeg',
        'assets/images/persongrey3.jpeg',
      ],
      'subtitle': 'Today, Shared by-Unbox',
      'date': 'July 5, 2021-July 10, 2021',
      'presentagetext': '30%'
    }
  ];
}
