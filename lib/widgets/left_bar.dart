import 'package:flutter/material.dart';
import 'package:my_calculator/constants/bmi_constants.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key, required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 25.0,
        width: barWidth,
        decoration: const BoxDecoration(
          color: textColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
    );
  }
}

class LeftBars extends StatelessWidget {
  const LeftBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        LeftBar(barWidth: width * .08),
        SizedBox(height: height * .02),
        LeftBar(barWidth: width * .18),
        SizedBox(height: height * .02),
        LeftBar(barWidth: width * .28),
      ],
    );
  }
}
