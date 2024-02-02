import 'package:flutter/material.dart';
import 'package:myntra/screen/detail/view/detail_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>screen_routes={
  '/':(context) => const HomeScreen(),
  'detail':(context) => const DetailScreen(),
};