import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  CarouselController carouselController = CarouselController();

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
                ),
          ),
          actions:  [
            IconButton(onPressed: () {
              Get.toNamed("cart");
            }, icon: const Icon(CupertinoIcons.cart),),
            const SizedBox(
              width: 10,
            ),
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/image/profile.jpg'),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) => InkWell(
                    onTap: () {
                      controller.changeIndex(index);
                      Get.toNamed('detail',
                          arguments: controller.productList[index]);
                    },
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.13,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey,
                              blurRadius: 2)
                        ],
                      ),
                      child: Image.network(
                        "${controller.productList[index].image}",
                        height: 100,
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        controller.changeIndex(index);
                      },
                      initialPage: controller.isIndex.value,
                      animateToClosest: true,
                      autoPlay: true,
                      enlargeCenterPage: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SmoothPageIndicator(
                    onDotClicked: (index) {
                      controller.changeIndex(index);
                    },
                    controller:
                        PageController(initialPage: controller.isIndex.value),
                    count: 5,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      // type: WormType.thinUnderground
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Now!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See More",
                      style: TextStyle(
                          color: Color(0xffEE5F73),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.toNamed("detail",
                            arguments: controller.productList[index]);
                      },
                      child: Container(
                        height: 232,
                        width: 160,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurStyle: BlurStyle.outer,
                                color: Colors.grey,
                                blurRadius: 2)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.favorite_border)),
                            Center(
                                child: Image.network(
                              "${controller.productList[index].image}",
                              height: 100,
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${controller.productList[index].cat}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "${controller.productList[index].title}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                const Text('4.5'),
                                const Spacer(),
                                Text(
                                  "\$ ${controller.productList[index].price}",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 250),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
