import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';

import '../../home/controller/home_controller.dart';
import '../../home/model/product_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller = Get.put(HomeController());
  ProductModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'assets/image/logo.png',
            height: 36,
            width: 40,
          ),
          title: const Text(
            "Wyntra",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: 1.0,
            ),
          ),
          actions: const [
            Icon(CupertinoIcons.search),
            SizedBox(
              width: 20,
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/image/profile.jpg'),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(CupertinoIcons.back),
                      ),
                      const LikeButton(),
                    ],
                  ),
                  Center(
                    child: Image.network(
                      "${model.image}",
                      height: 250,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${model.cat}",
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  Text(
                    "${model.title}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${model.price}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "60% Off",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 25,
                      ),
                      const Text(
                        '4.5',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const Text(
                    "About The Product",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${model.dec}",
                    style: const TextStyle(fontSize: 17, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(onTap: () {
                        controller.cartList.add(model);
                        Get.back();
                      },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffEE5F73),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.shopping_cart,
                                color: Color(0xffEE5F73),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: Color(0xffEE5F73), letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.cartList.add(model);
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                              color: const Color(0xffEE5F73),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "BUY NOW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
