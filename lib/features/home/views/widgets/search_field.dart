import 'package:flutter/material.dart';
import 'package:fruitstore/features/home/views/controllers/home_controller.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required HomeController homeController,
  }) : _homeController = homeController;

  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _homeController.textEditingController,
        focusNode: _homeController.focusNode,
        onChanged: _homeController.searchFruits,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }
}
