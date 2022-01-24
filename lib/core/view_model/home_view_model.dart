import 'package:ecommerce_app/core/service/home_services.dart';
import 'package:ecommerce_app/model/category_model.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [
    CategoryModel.fromJson({
      "name": "Category 1",
      "image":
          "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"
    }),
    CategoryModel.fromJson({
      "name": "Category 2",
      "image":
          "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"
    }),
    CategoryModel.fromJson({
      "name": "Category 3",
      "image":
          "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"
    }),
    CategoryModel.fromJson({
      "name": "Category 4",
      "image":
          "https://pics.freeicons.io/uploads/icons/png/18879031931588529849-512.png"
    })
  ];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [
    ProductModel.fromJson({
      "name": "product 1",
      "image":
          "https://icon-library.com/images/damaged-icon/damaged-icon-18.jpg",
      "description": "new Product",
      "sized": "XL",
      "price": "300",
      "color": "DEDEDE",
      "cashBack": "20",
      "points": "15",
      "marketPrice": "340"
    }),
    ProductModel.fromJson({
      "name": "product 2",
      "image":
          "https://icon-library.com/images/damaged-icon/damaged-icon-18.jpg",
      "description": "new Product 2",
      "sized": "XL",
      "price": "220",
      "color": "DEDEDE",
      "cashBack": "10",
      "points": "8",
      "marketPrice": "270"
    }),
    ProductModel.fromJson({
      "name": "product 3",
      "image":
          "https://icon-library.com/images/damaged-icon/damaged-icon-18.jpg",
      "description": "new Product",
      "sized": "XL",
      "price": "290",
      "color": "DEDEDE",
      "cashBack": "25",
      "points": "10",
      "marketPrice": "340"
    }),
    ProductModel.fromJson({
      "name": "product 4",
      "image":
          "https://icon-library.com/images/damaged-icon/damaged-icon-18.jpg",
      "description": "new Product",
      "sized": "XL",
      "price": "307",
      "color": "DEDEDE",
      "cashBack": "22",
      "points": "17",
      "marketPrice": "350"
    }),
  ];

  // HomeViewModel() {
  //   getCategory();
  //   getBestSellingProducts();
  // }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }
}
