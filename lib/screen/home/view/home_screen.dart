import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
  }

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
                fontFamily: 'assets/font/font.ttf'),
          ),
          actions: const [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/image/profile.jpg'),
            )
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("${controller.productList[index].title}"),
              leading: Image.network("${controller.productList[index].image}"),
              trailing: IconButton(
                onPressed: () {
                  Get.toNamed("detail",
                      arguments: controller.productList[index]);
                },
                icon: const Icon(CupertinoIcons.forward),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
