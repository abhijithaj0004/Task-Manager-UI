import 'package:flutter/material.dart';

class ProjectProgressCheckbox extends StatelessWidget {
  ProjectProgressCheckbox({
    super.key,
    required this.title,
    required this.isCompleted,
  });
  final String title;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
            color: const Color.fromARGB(161, 123, 133, 249),
          ),
          activeColor: const Color.fromARGB(161, 123, 133, 249),
          value: isCompleted,
          onChanged: (value) {},
        ),
        // kWidth10,
        Text(title),
      ],
    );
  }
}
