

import 'package:bmi/mainscreen.dart';
import 'package:bmi/resultscreen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/1page',
    routes: [
GoRoute(path: '/1page',builder: (context,state,) {
  return const MainScreen();
},),
GoRoute(path: '/result',
builder: (context, state) {

  return ResultScreen(
  height: double.parse(heightController.text),
  weight: double.parse(weightController.text),
);}),
]);