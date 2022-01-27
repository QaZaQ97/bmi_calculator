import 'package:flutter/material.dart';
import 'package:my_calculator/constants/bmi_constants.dart';
import 'package:my_calculator/widgets/left_bar.dart';
import 'package:my_calculator/widgets/right_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: const Text(
            'BMI Calculator',
            style: TextStyle(color: textColor),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: height * .05),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                width: width * .26,
                child: TextField(
                  controller: _heightController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  style: f30W5.apply(color: textColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Height',
                    hintStyle: f30W5.apply(color: textColor.withOpacity(0.8)),
                  ),
                ),
              ),
              SizedBox(
                width: width * .26,
                child: TextField(
                  controller: _weightController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  style: f30W5.apply(color: textColor),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Weight',
                    hintStyle: f30W5.apply(color: textColor.withOpacity(0.8)),
                  ),
                ),
              ),
            ]),
            SizedBox(height: height * .05),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = 'You\'re over weight';
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = 'You have normal weight';
                  } else {
                    _textResult = 'You\'re under weight';
                  }
                });
              },
              child: const Text('Calculate', style: f26W5),
            ),
            SizedBox(height: height * .1),
            Text(_bmiResult.toStringAsFixed(2), style: f36W5),
            SizedBox(height: height * .08),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(_textResult, style: f36W5),
            ),
            SizedBox(height: height * .07),
            Stack(children: const [
              RightBars(),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: LeftBars(),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
