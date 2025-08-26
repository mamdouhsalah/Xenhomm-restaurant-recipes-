import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:flutter/material.dart';

Widget infoBox(String title, String value, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          "$title:\n$value",
          textAlign: TextAlign.center,
          style: Textstyle.text16Balck,
        ),
      ),
    );
  }