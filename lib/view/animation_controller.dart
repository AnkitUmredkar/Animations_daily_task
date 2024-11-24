import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({super.key});

  @override
  State<AnimationControllerExample> createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  int speed = 500;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: speed)
    );
    animationController.repeat();
    super.initState();
  }

  void updateSpeed(int newSpeed) {
    // animationController.stop(); // Stop the current animation
    animationController.duration = Duration(milliseconds: newSpeed); // Update duration
    animationController.repeat(); // Restart the animation
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(speed);
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Center(
            child: RotationTransition(
              turns: animationController,
              child: Image.asset("assets/images/moon.png"),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                speed += 100;
                updateSpeed(speed); // Update the animation controller
              });
            },
            child: const Icon(Icons.remove),
          ),
          const Gap(15),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (speed > 100) {
                  speed -= 100;
                  updateSpeed(speed); // Update the animation controller
                }
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
