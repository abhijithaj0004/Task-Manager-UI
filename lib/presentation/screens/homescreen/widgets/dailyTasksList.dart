import 'package:flutter/material.dart';
import 'package:taskmanager/core/constants.dart';

class DailyTasksTile extends StatelessWidget {
  const DailyTasksTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true, // Ensure the ListView takes only the necessary height
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.grey,
                size: 30,
              ),
              Column(
                children: [
                  Text('App Animation'),
                  kHeight10,
                  Text('---------------')
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.blue,
                        ),
                        Positioned(
                          left: 16,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.black,
                          ),
                        ),
                        Positioned(
                          left: 35,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
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
