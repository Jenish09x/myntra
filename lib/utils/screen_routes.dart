import 'package:flutter/material.dart';
import 'package:myntra/screen/cart/view/cart_screen.dart';
import 'package:myntra/screen/detail/view/detail_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>screen_routes={
  '/':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
  'cart':(context) => const CartScreen(),
};