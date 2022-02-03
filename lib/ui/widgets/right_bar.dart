import 'package:flutter/material.dart';
import 'package:my_calculator/constants/bmi_constants.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 25.0,
        width: barWidth,
        decoration: const BoxDecoration(
          color: textColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class RightBars extends StatelessWidget {
  const RightBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(children: [
      RightBar(barWidth: width * .28),
      SizedBox(height: height * .02),
      RightBar(barWidth: width * .18),
      SizedBox(height: height * .02),
      RightBar(barWidth: width * .08)
    ]);
  }
}
