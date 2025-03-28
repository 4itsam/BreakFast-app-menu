import 'package:flutter/material.dart';

class PopularFoodModels {
  String image;
  Color colorBox;
  String title;
  bool isSelected;

  PopularFoodModels({
    required this.colorBox,
    required this.title,
    required this.isSelected,
    required this.image
  });

  static List<PopularFoodModels> getPopularFood() {
    List<PopularFoodModels> foodModels = [];

    foodModels.add(
      PopularFoodModels(
        colorBox: Color.fromARGB(100, 255, 128, 0),
        title: "Toast Egg",
        isSelected: true,
        image: "assets/images/egg.png"
      ),
    );
        foodModels.add(
      PopularFoodModels(
        colorBox: Color.fromARGB(100,0, 255 ,98),
        title: "Tea",
        isSelected: true,
        image: "assets/images/tea.png"
      ),
    );

    return foodModels;
  }
}
