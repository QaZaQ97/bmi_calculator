import 'package:flutter/material.dart';
import 'package:my_calculator/constants/bmi_constants.dart';
import 'package:my_calculator/ui/widgets/left_bar.dart';
import 'package:my_calculator/ui/widgets/right_bar.dart';

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
    return Scaffold(
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
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            flex: 4,
            child: Row(children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _heightController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  style: f30W5.apply(color: textColor),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: const OutlineInputBorder(),
                    hintText: 'Height',
                    hintStyle: f30W5.apply(color: textColor.withOpacity(0.8)),
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _weightController,
                  maxLength: 5,
                  keyboardType: TextInputType.number,
                  style: f30W5.apply(color: textColor),
                  decoration: InputDecoration(
                    isCollapsed: true,
                    border: const OutlineInputBorder(),
                    hintText: 'Weight',
                    hintStyle: f30W5.apply(color: textColor.withOpacity(0.8)),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
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
          ),
          Expanded(
              flex: 2,
              child: Text(_bmiResult.toStringAsFixed(2), style: f36W5)),
          Expanded(
            flex: 2,
            child: Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(_textResult, style: f36W5),
            ),
          ),
          Expanded(
            flex: 8,
            child: Stack(children: const [
              RightBars(),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: LeftBars(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
