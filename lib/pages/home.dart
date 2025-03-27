// ignore: file_names
import 'package:breakfast/models/categorize_models.dart';
import 'package:breakfast/models/popular_food_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModels> category = [];
  List<PopularFoodModels> foodModels = [];

  void _getPopularFood() {
    foodModels = PopularFoodModels.getPopularFood();
  }

  void _getCategory() {
    category = CategoryModels.getCategoryModels();
  }

  @override
  Widget build(BuildContext context) {
    _getCategory();
    _getPopularFood();
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Colors.white,

      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchBox(),
              const SizedBox(height: 72),
              categoriesSection(context),
              const SizedBox(height: 50),
              popularFoodSection(context),
            ],
          ),
        ],
      ),
    );
  }

  Column popularFoodSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Popular\nfood",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 230,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: foodModels.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 230,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: foodModels[index].colorBox,
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 93,
                      width: 93,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: Image.asset(foodModels[index].image),
                    ),
                    Text(
                      foodModels[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      width: 125,
                      child: TextButton(
                        style: ButtonStyle(
                          shadowColor: const WidgetStatePropertyAll(Colors.black),
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                        onPressed:
                            () => _showBottomSheet(
                              context,
                              colorBox: foodModels[index].colorBox,
                              photo: foodModels[index].image,
                              title: foodModels[index].title,
                            ),
                        child: Text(
                          "View",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column categoriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "Categorize",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 130,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap:
                    () => _snackbar(
                      context,
                      title: category[index].title,
                      image: category[index].image,
                      colorBox: category[index].boxColor,
                    ),
                child: Container(
                  width: 108,
                  decoration: BoxDecoration(
                    color: category[index].boxColor,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),

                        child: Image.asset(category[index].image),
                      ),
                      Text(
                        category[index].title,
                        style: const TextStyle(
                          fontFamily: "sand",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: category.length,
            separatorBuilder:
                (BuildContext context, int index) => const SizedBox(width: 25),
          ),
        ),
      ],
    );
  }

  Padding _searchBox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(56, 48, 56, 0),
      child: Container(
        height: 50,
        width: double.infinity,

        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromARGB(25, 0, 0, 0),
              spreadRadius: 0,
              offset: Offset(0, 4),
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),

        child: TextField(
          cursorHeight: 0,

          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            // ignore: sized_box_for_whitespace
            prefixIcon: Container(
              width: 60,
              child: const IntrinsicHeight(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 67, 67, 67),
                      ),
                    ),
                    VerticalDivider(
                      color: Colors.grey,
                      width: 20,
                      thickness: 0.3,
                      endIndent: 10,
                      indent: 10,
                    ),
                  ],
                ),
              ),
            ),
            contentPadding: const EdgeInsetsDirectional.only(bottom: 100),

            hintText: "search",

            hintStyle: const TextStyle(
              fontFamily: "sand",
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "BreakFast",
        style: Theme.of(context).textTheme.headlineLarge,
      ),

      centerTitle: true,
      backgroundColor: Colors.white,

      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffFFF5D9),
            borderRadius: BorderRadius.circular(11),
          ),

          child: Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/Back.png", height: 15, width: 15),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _showDialog(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xffFFF5D9),
              borderRadius: BorderRadius.circular(11),
            ),

            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/Account.png",
                height: 20,
                width: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(
  BuildContext context, {
  required colorBox,
  required photo,
  required title,
}) {
  Scaffold.of(context).showBottomSheet(
    (context) => Container(
      height: 280,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorBox,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(photo, height: 100, width: 100),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontFamily: "sand", fontSize: 35),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 6, top: 8),
                      child: Text(
                        "90% OF people Like it\nBuy now and get\n40% discount",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: 200,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(colorBox),
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _snackbar(
  BuildContext context, {
  required title,
  required image,
  required colorBox,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      dismissDirection: DismissDirection.horizontal,
      backgroundColor: colorBox,
      content: Row(
        children: [Text(title), const SizedBox(width: 15), Image.asset(image)],
      ),
    ),
  );
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            "Ali Miri",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          titlePadding: const EdgeInsets.all(25),
          backgroundColor: Colors.white,
          
          actions: [
            
            TextButton(
              style: const ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  Color.fromARGB(50, 226, 226, 226),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Colors.black)),
            ),
                        TextButton(
              style: const ButtonStyle(
                overlayColor: WidgetStatePropertyAll(
                  Color.fromARGB(50, 226, 226, 226),
                ),
                backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 12, 12, 30)),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
        ),
  );
}
