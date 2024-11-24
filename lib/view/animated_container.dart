import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ContainerAnimation extends StatefulWidget {
  const ContainerAnimation({super.key});

  @override
  State<ContainerAnimation> createState() => _ContainerAnimationState();
}

class _ContainerAnimationState extends State<ContainerAnimation> {
  Alignment alignment = Alignment.center;
  TextEditingController textName = TextEditingController();
  bool showMsg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.blue.shade600,
        title: const Text(
          "Animated Container",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Stack(
          children: [
            // ---------------------> AnimatedText
            AnimatedAlign(
              alignment: alignment,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 700),
              child: SizedBox(
                width: 150,
                child: alignment == Alignment.topLeft
                    ? AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText(
                            speed: const Duration(milliseconds: 200),
                            "Hi, ${textName.text}",
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )
                        ],
                        onFinished: () {
                          Timer(
                            const Duration(seconds: 2),
                            () {
                              setState(() {
                                showMsg = true;
                                Future.delayed(
                                  const Duration(seconds: 6),
                                      () {
                                    setState(() {
                                      showMsg = false;
                                      alignment = Alignment.center;
                                    });
                                  },
                                );
                              });
                            },
                          );
                        },
                      )
                    //---------------------> Center TextField
                    : TextField(
                        textAlign: TextAlign.center,
                        controller: textName,
                      ),
              ),
            ),
            //---------------------> Message Container
            AnimatedAlign(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              child: AnimatedContainer(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                curve: Curves.easeInOut,
                width: showMsg ? MediaQuery.of(context).size.width * 0.82 : 0,
                height: showMsg ? 170 : 0,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                duration: const Duration(seconds: 1),
                child: showMsg
                    ? const Text(
                        "Only I can change my life. No one can do it for me.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    alignment = Alignment.topLeft;

                  });
                },
                icon: const Icon(Icons.arrow_circle_right,
                    color: Colors.red, size: 70),
              ),
            )
          ],
        ),
      ),
    );
  }
}
