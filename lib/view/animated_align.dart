import 'package:flutter/material.dart';

class AlignAnimation extends StatefulWidget {
  const AlignAnimation({super.key});

  @override
  State<AlignAnimation> createState() => _AlignAnimationState();
}

class _AlignAnimationState extends State<AlignAnimation> {
  Alignment alignment = Alignment.topLeft;
  Color iconColor = Colors.deepPurple;

  // Define a list of colors for smooth transitions
  final List<Color> colors = [
    Colors.deepPurple,
    Colors.redAccent,
    Colors.teal,
    Colors.amber,
    Colors.blueAccent,
  ];

  void updateAlignment(Alignment newAlignment, int colorIndex) {
    setState(() {
      alignment = newAlignment;
      iconColor = colors[colorIndex % colors.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.teal.shade600,
        title: const Text(
          "Animated Align",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: () => updateAlignment(Alignment.centerLeft, 0),
                  color: Colors.teal.shade700,
                  icon: const Icon(Icons.arrow_circle_left_outlined),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 40,
                      onPressed: () => updateAlignment(Alignment.topCenter, 1),
                      color: Colors.teal.shade700,
                      icon: const Icon(Icons.arrow_circle_up_rounded),
                    ),
                    const SizedBox(height: 15),
                    IconButton(
                      iconSize: 40,
                      onPressed: () => updateAlignment(Alignment.bottomCenter, 2),
                      color: Colors.teal.shade700,
                      icon: const Icon(Icons.arrow_circle_down_rounded),
                    ),
                  ],
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () => updateAlignment(Alignment.centerRight, 3),
                  color: Colors.teal.shade700,
                  icon: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
          AnimatedAlign(
            curve: Curves.fastOutSlowIn,
            alignment: alignment,
            duration: const Duration(milliseconds: 600),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.flight,
                size: 45,
                color: iconColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
