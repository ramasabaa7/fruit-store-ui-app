import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var cartQuantityItems = 0.obs;
  var cartItems = <FruitsAndBerriesDetailsModel>[].obs;
  final GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  // FruitsAndBerriesDetailsModel fruit;
  var selectedFruits = FruitsAndBerriesDetailsModel(
      '',
      '0',
      Image.asset('assets/images/avocado.png'),
      const Color(0xFFEDB6C9),
      '1',
      "");

  void clearCart() {
    cartQuantityItems.value = 0;
    cartItems.clear();
    cartKey.currentState!.runClearCartAnimation();
  }

  void removeFromCart(int index) {
    cartQuantityItems.value--;
    cartItems.remove(cartItems[index]);
    cartKey.currentState!.runCartAnimation(cartQuantityItems.toString());
  }

  int cartTotal() {
    int total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      int toInt = int.parse(cartItems[i].price);
      total += toInt;
    }
    return total;
  }

  void listClick(GlobalKey widgetKey) async {
    await runAddToCartAnimation(widgetKey);
    cartQuantityItems.value++;
    cartItems.add(selectedFruits);
    await cartKey.currentState!.runCartAnimation(cartQuantityItems.toString());
  }
}
