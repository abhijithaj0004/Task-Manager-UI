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
      'icon': Icon(
        Icons.timer_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Ongoing',
      'color': const Color.fromARGB(161, 123, 133, 249),
      'icon': Icon(
        Icons.shuffle_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Completed',
      'color': const Color.fromARGB(120, 149, 246, 70),
      'icon': Icon(
        Icons.check_box_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Cancel',
      'color': const Color.fromARGB(225, 249, 126, 64),
      'icon': Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: 30,
      )
    }
  ];
}
