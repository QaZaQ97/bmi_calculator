import 'package:flutter/material.dart';
import 'package:my_calculator/constants/bmi_constants.dart';
import 'package:my_calculator/ui/main_screen.dart';

void main() => runApp(const BodyMassIndex());

class BodyMassIndex extends StatelessWidget {
  const BodyMassIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: textColor),
        ).apply(bodyColor: textColor),
      ),
      home: const MainScreen(),
    );
  }
}
