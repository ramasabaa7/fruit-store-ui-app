// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'package:fruitstore/features/card/view/controller/card_controller.dart';

class CardCartWidget extends StatelessWidget {
  const CardCartWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Container(
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 17, vertical: 7),
      padding: const EdgeInsetsDirectional.all(7),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: cartController.cartItems[index].color.withOpacity(0.8),
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
          color: cartController.cartItems[index].color.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.0)),
      child: Slidable(
        key: ValueKey(cartController.cartItems[index]),
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
                  cartController.cartItems[index].name.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
                Text(
                  cartController.cartItems[index].price + r'  $',
                  style: const TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w300),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward)),
      ),
    );
  }
}
