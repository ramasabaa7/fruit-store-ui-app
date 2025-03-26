import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fruitstore/features/card/view/controller/card_controller.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ListCartItemsWidget extends StatelessWidget {
  const ListCartItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 250),
            child: Text("Your cart is empty :("),
          ),
        );
      }
      return Expanded(
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: cartController
                .cartItems.length, //   padding: EdgeInsetsDirectional.all(15),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ZoomTapAnimation(
                      child: Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 17, vertical: 7),
                        padding: const EdgeInsetsDirectional.all(7),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: cartController.cartItems[index].color
                                    .withOpacity(0.8),
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
                            color: cartController.cartItems[index].color
                                .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Slidable(
                          key: ValueKey(cartController.cartItems[index]),
                          //   key: const ValueKey(0),
                          direction: axisDirectionToAxis(AxisDirection.right),
                          startActionPane: ActionPane(
                            dismissible: DismissiblePane(
                              onDismissed: () {
                                cartController.removeFromCart(index);
                              },
                            ),
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) {
                                  cartController.removeFromCart(index);
                                  cartController.cartTotal();
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ],
                          ),
                          child: ListTile(
                              leading: cartController.cartItems[index].image,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartController.cartItems[index].name
                                        .toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    cartController.cartItems[index].price
                                            .toString() +
                                        r' $',
                                    style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              trailing: const Icon(Icons.arrow_forward)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
