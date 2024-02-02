import 'package:get/get.dart';

import '../../../utils/api_helper.dart';
import '../model/product_model.dart';

class HomeController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> cartList = <ProductModel>[].obs;
  RxInt isIndex=0.obs;

  Future<void> getProductData() async {
    List<ProductModel>? list = await ApiHelper.helper.getProductApi();
    if (list != null) {
      productList.value = list;
    }
  }

  void changeIndex(int i)
  {
    isIndex = i.obs;
  }

}