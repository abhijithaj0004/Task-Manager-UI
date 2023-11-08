import 'package:flutter/material.dart';
import 'package:taskmanager/core/constants.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/constants/home_model.dart';

class DashboardList extends StatelessWidget {
  const DashboardList({
    super.key,
    required this.homeModel, required this.ontap,
  });

  final HomeModels homeModel;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: homeModel.dashBoardlist[index]['color'],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                homeModel.dashBoardlist[index]['icon'],
                kHeight20,
                Text(
                  homeModel.dashBoardlist[index]['name'],
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
      itemCount: homeModel.dashBoardlist.length,
    );
  }
}
