import 'package:flutter/material.dart';
import 'package:flutter_leadify/utils/constants/constants.dart';

class LeadStageWidget extends StatelessWidget {
  final int leadScore;
  const LeadStageWidget({super.key, required this.leadScore});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Circle(
                active: leadScore >= 1,
                stage: 1,
              ),
              Text(
                LeadStage.aware,
                style: TT.f12w500.copyWith(
                    color: !(leadScore >= 1)
                        ? AppColors.unselectedBottomNavigationBarColor
                            .withOpacity(0.5)
                        : Colors.green),
              )
            ],
          ),
          Line(
            active: leadScore >= 2,
          ),
          Column(
            children: [
              Circle(active: leadScore >= 2, stage: 2),
              Text(
                LeadStage.interested,
                style: TT.f12w500.copyWith(
                    color: !(leadScore >= 2)
                        ? AppColors.unselectedBottomNavigationBarColor
                            .withOpacity(0.5)
                        : Colors.green),
              )
            ],
          ),
          Line(
            active: leadScore >= 3,
          ),
          Column(
            children: [
              Circle(active: leadScore >= 3, stage: 3),
              Text(
                LeadStage.desire,
                style: TT.f12w500.copyWith(
                    color: !(leadScore >= 3)
                        ? AppColors.unselectedBottomNavigationBarColor
                            .withOpacity(0.5)
                        : Colors.green),
              )
            ],
          ),
          Line(
            active: leadScore >= 4,
          ),
          Column(
            children: [
              Circle(
                active: leadScore >= 4,
                stage: 4,
              ),
              Text(
                LeadStage.closed,
                style: TT.f12w500.copyWith(
                    color: !(leadScore >= 4)
                        ? AppColors.unselectedBottomNavigationBarColor
                            .withOpacity(0.5)
                        : Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final bool active;
  final int stage;
  const Circle({super.key, this.active = false, required this.stage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          color: !active
              ? AppColors.unselectedBottomNavigationBarColor.withOpacity(0.5)
              : Colors.green,
          borderRadius: BorderRadius.circular(100000)),
      child: Center(
          child: Text(
        stage.toString(),
        style: TT.f12w500.copyWith(color: AppColors.textWhite),
      )),
    );
  }
}

class Line extends StatelessWidget {
  final bool active;
  const Line({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: (MediaQuery.sizeOf(context).width - 40 - 24 * 4) / 4,
      decoration: BoxDecoration(
          color: active
              ? Colors.green
              : AppColors.unselectedBottomNavigationBarColor.withOpacity(0.5)),
    );
  }
}
