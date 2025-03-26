import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/fruits_and_berries_details_model.dart';

class FruitsAndBerriesDetailsRepo {
  Future<List<FruitsAndBerriesDetailsModel>> fetchFruitsData() async {
    final String response = await rootBundle.loadString('json/fruit_info.json');
    final List<dynamic> data = json.decode(response);

    return data.map((fruit) {
      return FruitsAndBerriesDetailsModel(
        fruit['name'],
        fruit['price'],
        Image.asset(
          fruit['image'],
        ),
        Color(
            int.parse(fruit['color'].substring(1, 7), radix: 16) + 0xFF000000),
        fruit['quantity'],
        fruit['type'],
      );
    }).toList();
  }
}
