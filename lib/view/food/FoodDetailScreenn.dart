import 'package:flutter/material.dart';
import 'package:food_recipes/models/Meal.dart';
import 'package:food_recipes/service/FoodAPIService.dart';

class FoodDetailScreen extends StatefulWidget {
  final String? foodID;

  const FoodDetailScreen({super.key, required this.foodID});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  FoodAPIService foodAPIService = FoodAPIService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Meal?>(
          future: foodAPIService.getFoodDetails(widget.foodID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.meals?.length,
                  itemBuilder: (context, index) {
                    Meals meal = snapshot.data!.meals![index];
                    var ingreditientsList =
                        foodAPIService.getIngreditientsList(meal);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Hero(
                                tag: meal.strMealThumb ?? "",
                                child: Image.network(meal.strMealThumb ?? "")),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.orange,
                              ),
                              color: Colors.white,
                            )
                          ],
                        ),
                        Text(meal.strMeal ?? ""),
                        Container(
                          height: 400,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: ingreditientsList.length,
                            itemBuilder: (context, index) {
                              return Text(ingreditientsList[index].toString());
                            },
                          ),
                        )
                      ],
                    );
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
