import 'dart:convert';

import 'package:http/http.dart' as http;

import '../screen/home/model/product_model.dart';

class ApiHelper {
  static ApiHelper helper = ApiHelper._();

  ApiHelper._();

  Future<List<ProductModel>?> getProductApi() async {
    String apiLink = 'https://fakestoreapi.com/products';
    var response = await http.get(Uri.parse(apiLink));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      List<ProductModel> productList =
          json.map((e) => ProductModel.mapToModel(e)).toList();

      return productList;
    }
    return null;
  }
}
