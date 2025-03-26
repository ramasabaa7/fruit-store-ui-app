import 'package:flutter/material.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:fruitstore/features/home/views/widgets/rich_text_details.dart';

class FruitDetailsContent extends StatelessWidget {
  final FruitsAndBerriesDetailsModel details;

  const FruitDetailsContent({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 60),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: details.color.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: CloseButton(color: details.color),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: details.image,
                ),
              ),
              Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  child: Text(
                    details.name,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              RichTextDetails(
                title: 'Price',
                subTitle: r'$' + (details.price),
              ),
              RichTextDetails(
                title: 'Quantity',
                subTitle: '${details.quantity}kg',
              ),
              RichTextDetails(
                title: 'Type',
                subTitle: details.type,
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ],
      ),
    );
  }
}
