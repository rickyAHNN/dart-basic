import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  String _calcBmi(double bmi) {
    String result = '저체중';
    if (bmi >= 35) {
      result = '한돈 ++1등급';
    } else if (bmi >= 30) {
      result = '한돈 1등급';
    } else if (bmi >= 25) {
      result = '한동 2등급';
    } else if (bmi >= 23) {
      result = '한돈 3등급';
    } else if (bmi >= 18.5) {
      result = '그냥 돼지';
    }
    return result;
  }

  Widget _buildIcon(double bmi) {
    Lottie.asset('assets/AnimationsuperPig.json');
    Icon icon = const Icon(
      Icons.sentiment_dissatisfied,
      color: Colors.amber,
      size: 100,
    );
    if (bmi >= 23) {
      Lottie.asset('assets/AnimationfitPig.json');

      icon = const Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.amber,
        size: 100,
      );
    } else if (bmi >= 18.5) {
      Lottie.asset('assets/AnimationfitPig.json');

      icon = const Icon(
        Icons.sentiment_satisfied,
        color: Colors.amber,
        size: 100,
      );
    }
    return Lottie.asset('assets/AnimationsuperPig.json');
  }

  @override
  Widget build(BuildContext context) {
    final bmi = weight / ((height / 100.0) * (height / 100.0));
    String result = '정상';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _calcBmi(bmi),
              style: const TextStyle(fontSize: 36),
            ),
            _buildIcon(bmi),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('당신의 돼지력은?'),
      ),
    );
  }
}
