import 'package:flutter/material.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:fruitstore/features/home/views/widgets/dialog_widgets/show_custom_dialog.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FruitCard extends StatelessWidget {
  final FruitsAndBerriesDetailsModel fruit;

  final int index;
  final void Function(GlobalKey) onClick;
  const FruitCard(
      {super.key,
      required this.fruit,
      required this.index,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    final GlobalKey widgetKey = GlobalKey();
    final CartController cartController = Get.find();

    return ZoomTapAnimation(
      onTap: () {
        showCustomDialog(context, fruit);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.03, vertical: Get.height * 0.01),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: fruit.color.withOpacity(0.6),
              offset: const Offset(
                4.0,
                4.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          color: fruit.color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Text(
                          fruit.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {
                                showCustomDialog(context, fruit);
                              },
                              icon: const Icon(Icons.more_vert))),
                    ],
                  ),
                  Container(
                    key: widgetKey,
                    child: fruit.image,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                cartController.selectedFruits = fruit;
                onClick(widgetKey);
                cartController.cartTotal();
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: fruit.color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
