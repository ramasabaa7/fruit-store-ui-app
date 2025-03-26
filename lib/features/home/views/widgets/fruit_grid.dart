import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:fruitstore/features/home/views/controllers/home_controller.dart';
import 'package:fruitstore/features/home/views/widgets/fruit_card.dart';
import 'package:get/get.dart';

class FruitGridView extends StatelessWidget {
  const FruitGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final CartController cartController = Get.put(CartController());
    return Obx(() {
      final fruitsToShow = homeController.filteredFruitList;

      return fruitsToShow.isEmpty
          ? const Center(child: Text('No fruits found'))
          : AnimationLimiter(
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: fruitsToShow.length,
                itemBuilder: (context, index) {
                  final fruit = fruitsToShow[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 300),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                          child: FruitCard(
                        onClick: cartController.listClick,
                        fruit: fruit,
                        index: index,
                      )),
                    ),
                  );
                },
              ),
            );
    });
  }
}
