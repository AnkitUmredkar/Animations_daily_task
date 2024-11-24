import 'package:animations_daily_task/view/animation_controller.dart';
import 'package:animations_daily_task/view/hero_animation/home_page.dart';
import 'package:flutter/material.dart';

import 'view/animated_align.dart';
import 'view/animated_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationControllerExample(),
    );
  }
}
