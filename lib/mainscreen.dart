import 'package:bmi/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

final heightController = TextEditingController();
final weightController = TextEditingController();
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(heightController.text));
    await prefs.setDouble('weight', double.parse(weightController.text));
  }

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');
    if (height != null && weight != null) {
      heightController.text = '$height';
      weightController.text = '$weight';
      print('$height, $weight');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('돼지 판별기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                controller: heightController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '키의 값을 입력하세요';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: weightController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '몸무게 값을 입력하세요';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  save();
                  context.push('/result');// 결과버튼
                  // Navigator.push(
                  //     (context, builder) {
                  //   // final heights =state.extra! as double;
                  //   return ResultScreen(
                  //   height: double.parse(heightController.text),
                  //
                  //   weight: double.parse(weightController.text),
                  // );}
                  // //   MaterialPageRoute(
                  //       ),
                  // );
                },
                child: const Text('결과'),
              ),
              Lottie.asset('assets/AnimationPig.json'),



          ],
          ),
        ),
      ),
    );
  }
}
