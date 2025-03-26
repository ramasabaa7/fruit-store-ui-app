import 'package:flutter/material.dart';
import 'package:fruitstore/features/card/view/widgets/cart_screen_app_bar.dart';
import 'package:fruitstore/features/card/view/widgets/down_widget.dart';
import 'package:fruitstore/features/card/view/widgets/list_cart_items_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CartScreenAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListCartItemsWidget(),
          DownWidget(),
        ],
      ),
    );
  }
}
