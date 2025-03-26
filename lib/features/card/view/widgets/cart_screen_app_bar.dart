import 'package:flutter/material.dart';

class CartScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("My Cart"),
      centerTitle: true,
      elevation: 0,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black54,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 18.0),
          child: Icon(Icons.more_vert),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
