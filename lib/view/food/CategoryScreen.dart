import 'package:flutter/material.dart';
import 'package:food_recipes/service/FoodAPIService.dart';
import 'package:food_recipes/view/food/FoodDetailScreenn.dart';

import '../../models/Meal.dart';

class CategoryScreen extends StatefulWidget {
  final String? categoryName;

  const CategoryScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  FoodAPIService foodAPIService = FoodAPIService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Meal?>(
      future: foodAPIService.filterFoodListByCategoryName(widget.categoryName),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: snapshot.data?.meals?.length,
              itemBuilder: (context, index) {
                return foodCard(context, snapshot.data?.meals?[index]);
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}

Widget foodCard(BuildContext context, Meals? meal) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailScreen(
              foodID: meal?.idMeal,
            ),
          ));
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Hero(
                tag: meal?.strMeal ?? "",
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(meal?.strMealThumb ?? ""),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 5),
            child: Text(
              meal?.strMeal ?? "",
            ),
          ),
        ],
      ),
    ),
  );
}
