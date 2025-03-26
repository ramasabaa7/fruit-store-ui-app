import 'package:flutter/material.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DownWidget extends StatelessWidget {
  const DownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Column(
      children: [
        Obx(
          () {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Order Total :",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    cartController.cartTotal().toString() + r"  $",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ZoomTapAnimation(
              child: Container(
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: IconButton(
                      onPressed: () {
                        cartController.clearCart();
                        cartController.cartTotal();
                      },
                      icon: const Icon(Icons.cleaning_services))),
            ),
            ZoomTapAnimation(
              child: Container(
                  height: Get.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadiusDirectional.circular(10),
                      border: Border.all(color: Colors.black12)),
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: Get.width * 0.25,
                      vertical: Get.height * 0.01),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
