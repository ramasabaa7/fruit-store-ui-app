import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:fruitstore/features/home/data/repo/fruits_and_berries_details_repo.dart';

class HomeController extends GetxController {
  final FruitsAndBerriesDetailsRepo _repo = FruitsAndBerriesDetailsRepo();
  var fruitList = <FruitsAndBerriesDetailsModel>[].obs;
  var filteredFruitList = <FruitsAndBerriesDetailsModel>[].obs;

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    loadFruitsData();
  }

  void searchFruits(String query) {
    if (query.isEmpty) {
      filteredFruitList.value = fruitList;
    } else {
      filteredFruitList.value = fruitList
          .where(
              (fruit) => fruit.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  void loadFruitsData() async {
    try {
      final data = await _repo.fetchFruitsData();
      fruitList.value = data;
      filteredFruitList.value = data;
    } catch (e) {
      // ignore: avoid_print
      print("Error loading fruits data: $e");
    }
  }

  void clearFocus() {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
