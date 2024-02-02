import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () =>  ListView.builder(
            itemCount:controller.cartList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Image.network(
                "${controller.cartList[index].image}",
                height: 120,
              ),
              title: Text(
                '${controller.cartList[index].title}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                '\$${controller.cartList[index].price}',
                style: const TextStyle(fontSize: 15, color: Colors.green),
              ),
              trailing: IconButton(onPressed: () {
                controller.cartList.removeAt(index);
              }, icon: const Icon(Icons.delete)),
            ),
          ),
        ),
      ),
    );
  }
}
