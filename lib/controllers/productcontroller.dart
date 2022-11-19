import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:store_app_git/models/Product.dart';

class ProductController extends GetxController {
  var productList = <Product>[].obs;

  void fetchProducts() async {}
}
