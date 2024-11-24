import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.white),
        titleSpacing: 7,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              for (int i = 0; i < targetImage.length; i++) {
                targetImage[i] = false;
              }
              draggableImages = List.from(images);
              restart = 0;
            });
          },color: Colors.white, icon: const Icon(Icons.restart_alt))
        ],
        title: const Text(
          'Puzzle game',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  children: List.generate(
                    name.length,
                    (index) {
                      if (restart == targetImage.length) {
                        for (int i = 0; i < targetImage.length; i++) {
                          targetImage[i] = false;
                        }
                        restart = 0;
                      }
                      return DragTarget<String>(
                        onAcceptWithDetails: (details) {
                          setState(() {
                            if (details.data == imagesTarget[index]) {
                              targetImage[index] = true;
                              draggableImages.remove(details.data);
                              restart += 1;
                              // Check if all targets are filled
                              if (restart == targetImage.length) {
                                showCompletionDialog(context);
                              }
                            } else {
                              // Show snackbar on wrong match
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Wrong match! Try again.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            height: height * 0.1,
                            width: width * 0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: (targetImage[index])
                                ? Image.network(
                                    imagesTarget[index],
                                    fit: BoxFit.cover,
                                  )
                                : Text(name[index]),
                          );
                        },
                      );
                    },
                  ),
                ),
                const Gap(20),
                Wrap(
                  children: List.generate(
                    draggableImages.length,
                    (index) {
                      return Draggable<String>(
                        data: draggableImages[index],
                        feedback: buildObject(height, width, index),
                        childWhenDragging: Container(),
                        // Empty container when dragging
                        child: buildObject(height, width, index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildObject(double height, double width, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      height: height * 0.1,
      width: width * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Image.network(
        draggableImages[index],
        fit: BoxFit.contain,
      ),
    );
  }

  void showCompletionDialog(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Congratulations!'),
            content: const Text('You have completed the puzzle.'),
            actions: [
              TextButton(
                onPressed: () {
                  // Restart the game
                  setState(() {
                    for (int i = 0; i < targetImage.length; i++) {
                      targetImage[i] = false;
                    }
                    draggableImages = List.from(images);
                    restart = 0;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> name = [
  'Tiger',
  'Lion',
  'Apple',
  'Doremon',
  'Dart',
  'Virat Kohli',
  'Peacock',
  'Flutter',
  'Car',
];

int restart = 0;

List<String> imagesTarget = [
  'https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJu4O66HisnA0Rvc8AnY0DQPLShY3gvUDTXw&s',
  'https://hbkonline.in/pub/media/catalog/product/a/p/apple_fruit_powder3.jpg',
  'https://freepngimg.com/thumb/doraemon/71299-nobi-youtube-nobita-television-doraemon-free-photo-png-thumb.png',
  'https://ih1.redbubble.net/image.1153489054.7327/fposter,small,wall_texture,product,750x1000.u4.jpg',
  'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcR6AK1OtJ2FXnHR6omrAJwzJUpDnlRN4K-L3NfsTyFLYE2M4MFb26tkd0lxmNiNcEtINJw_Bjvc3RrQysQ',
  'https://i.pinimg.com/474x/3f/e9/8a/3fe98ae144cf13e4d4e2790504f8e155.jpg',
  'https://global.discourse-cdn.com/auth0/original/3X/e/c/ec121d8cfbeb56e6cb593e3eb98876890c73b37e.png',
  'https://www.pngall.com/wp-content/uploads/2/Sedan-Car-PNG-File-Download-Free.png',
];

List<bool> targetImage = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<String> images = [
  'https://global.discourse-cdn.com/auth0/original/3X/e/c/ec121d8cfbeb56e6cb593e3eb98876890c73b37e.png',
  'https://i.pinimg.com/474x/3f/e9/8a/3fe98ae144cf13e4d4e2790504f8e155.jpg',
  'https://www.pngall.com/wp-content/uploads/2/Sedan-Car-PNG-File-Download-Free.png',
  'https://hbkonline.in/pub/media/catalog/product/a/p/apple_fruit_powder3.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJu4O66HisnA0Rvc8AnY0DQPLShY3gvUDTXw&s',
  'https://freepngimg.com/thumb/doraemon/71299-nobi-youtube-nobita-television-doraemon-free-photo-png-thumb.png',
  'https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg',
  'https://ih1.redbubble.net/image.1153489054.7327/fposter,small,wall_texture,product,750x1000.u4.jpg',
  'https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcR6AK1OtJ2FXnHR6omrAJwzJUpDnlRN4K-L3NfsTyFLYE2M4MFb26tkd0lxmNiNcEtINJw_Bjvc3RrQysQ',
];

List<String> draggableImages = List.from(images);
