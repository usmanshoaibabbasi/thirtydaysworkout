import 'package:flutter/material.dart';
import 'package:thirty_days_workout/data/constants.dart';
import 'package:thirty_days_workout/main.dart';
import 'package:thirty_days_workout/modals/weight_loss_plan_modal.dart';

class WeightLossPlanCard extends StatelessWidget {
  final weightLossPlanModal indexofWeightLossDietPlanList;
  final int lastindex;
  const WeightLossPlanCard({
    Key? key,
    required this.indexofWeightLossDietPlanList,
    required this.lastindex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          weightLossPlanDaysRoute,
          arguments: {
            'daynumber': indexofWeightLossDietPlanList.day,
          },
        );
      },
      child: Container(
        margin: indexofWeightLossDietPlanList.day == lastindex
            ? const EdgeInsets.fromLTRB(10, 15, 10, 20)
            : const EdgeInsets.fromLTRB(10, 15, 10, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 9.0,
            ),
          ],
        ),
        child: Container(
          width: screenwidth,
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Day ${indexofWeightLossDietPlanList.day}',
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: dietplandayslisttextcolor),
          ),
        ),
      ),
    );
  }
}
