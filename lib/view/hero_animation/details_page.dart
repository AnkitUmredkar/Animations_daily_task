import 'package:animations_daily_task/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  final ProductModel product;
  final String tag;

  const DetailsPage({super.key, required this.index, required this.product, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: CupertinoColors.systemBlue,
        middle: const Text(
          "Details Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15,15,15,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                transitionOnUserGestures: true,
                tag: tag,
                child: Image.asset(
                  product.image,
                  height: 250,
                ),
              ),
            ),
            const Gap(6),
            Text(
              product.name,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              product.price,
              style: const TextStyle(fontSize: 18),
            ),
            const Gap(8),
            const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est labor")
          ],
        ),
      ),
    );
  }
}
