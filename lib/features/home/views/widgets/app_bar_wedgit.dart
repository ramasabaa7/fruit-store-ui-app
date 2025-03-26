import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:fruitstore/features/card/view/screens/cart_screen.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return AppBar(
      title: const Text(
        'Fruits and berries',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54,
      actions: [
        ZoomTapAnimation(
          onTap: () {
            Get.to(() => const CartScreen());
          },
          child: Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.06),
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: AddToCartIcon(
              key: cartController.cartKey,
              icon: const Icon(Icons.shopping_cart),
              badgeOptions: const BadgeOptions(
                active: true,
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
