import 'package:flutter/material.dart';

class CategoryModels {
  Color boxColor;
  String image;
  String title;

  CategoryModels({
    required this.boxColor,
    required this.image,
    required this.title,
  });

  static List<CategoryModels> getCategoryModels() {
    List<CategoryModels> category = [];

    category.add(
      CategoryModels(
        boxColor: const Color.fromARGB(82, 0, 170, 255),
        image: "assets/images/salad.png",
        title: "Salad",
      ),
    );
    category.add(
      CategoryModels(
        boxColor: const Color.fromARGB(82, 255, 0, 4),
        image: "assets/images/fruit.png",
        title: "fruit",
      ),
    );
    category.add(
      CategoryModels(
        boxColor: const Color.fromARGB(82, 0, 255, 30),
        image: "assets/images/drinks.png",
        title: "Drinks",
      ),
    );
    category.add(
      CategoryModels(
        boxColor: const Color.fromARGB(82, 255, 149, 0),
        image: "assets/images/special.png",
        title: "Special",
      ),
    );

    return category;
  }
}
