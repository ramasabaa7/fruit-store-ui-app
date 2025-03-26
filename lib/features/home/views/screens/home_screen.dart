import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:flutter/material.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:fruitstore/features/home/views/widgets/app_bar_wedgit.dart';
import 'package:fruitstore/features/home/views/widgets/fruit_grid.dart';
import 'package:fruitstore/features/home/views/widgets/search_field.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return AddToCartAnimation(
      cartKey: _cartController.cartKey,
      height: 30,
      width: 30,
      opacity: 0.85,
      dragAnimation: const DragToCartAnimationOptions(
        rotation: true,
      ),
      jumpAnimation: const JumpAnimationOptions(),
      createAddToCartAnimation: (runAddToCartAnimation1) {
        _cartController.runAddToCartAnimation = runAddToCartAnimation1;
      },
      child: GestureDetector(
        onTap: _homeController.clearFocus,
        child: Scaffold(
          appBar: const CustomAppBar(),
          body: Column(
            children: [
              CustomSearchField(
                homeController: _homeController,
              ),
              const Expanded(child: FruitGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
