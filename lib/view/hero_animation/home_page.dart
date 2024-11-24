import 'package:animations_daily_task/model/product_model.dart';
import 'package:animations_daily_task/utils/global.dart';
import 'package:animations_daily_task/view/hero_animation/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> productModel =
        productList.map((e) => ProductModel.fromMap(e)).toList();
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBlue,
        middle: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        itemCount: productModel.length,
        separatorBuilder: (context, index) => const Divider(
          endIndent: 25,
          indent: 30,
        ),
        itemBuilder: (context, index) {
          final product = productModel[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      index: 0,
                      product: product,
                      tag: "product$index",
                    ),
                  ),
                );
              },
              child: Row(
                children: [
                  Hero(
                      tag: "product$index",
                      transitionOnUserGestures: true,
                      child: Image.asset(product.image, height: 70)),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        product.price,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
