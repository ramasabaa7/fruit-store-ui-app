import 'package:flutter/material.dart';
import 'package:fruitstore/features/home/data/models/fruits_and_berries_details_model.dart';
import 'package:fruitstore/features/home/views/widgets/dialog_widgets/fruit_details_dialog.dart';

void showCustomDialog(
    BuildContext context, FruitsAndBerriesDetailsModel selectedFruitsDetails) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (_, __, ___) {
      return Center(
        child: FruitDetailsDialog(selectedFruitsDetails: selectedFruitsDetails),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
