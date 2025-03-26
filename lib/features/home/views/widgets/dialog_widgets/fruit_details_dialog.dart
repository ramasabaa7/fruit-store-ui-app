import 'package:flutter/material.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:fruitstore/features/home/views/widgets/dialog_widgets/fruit_details_content.dart';

class FruitDetailsDialog extends StatelessWidget {
  final FruitsAndBerriesDetailsModel selectedFruitsDetails;

  const FruitDetailsDialog({
    super.key,
    required this.selectedFruitsDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: FruitDetailsContent(details: selectedFruitsDetails),
    );
  }
}
