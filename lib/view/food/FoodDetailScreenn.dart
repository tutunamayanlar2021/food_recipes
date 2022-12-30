import 'package:flutter/material.dart';
import 'package:food_recipes/constants/color_constant.dart';
import 'package:food_recipes/constants/style_constant.dart';
import 'package:food_recipes/models/Meal.dart';
import 'package:food_recipes/service/FoodAPIService.dart';

import 'package:url_launcher/url_launcher_string.dart';

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
    double displayWidth = MediaQuery.of(context).size.width;

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
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          meal.strMeal ?? "",
                          style: StyleConstants.instance.desTitle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ingredients",
                                style: StyleConstants.instance.subTitle,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: ingreditientsList.length,
                                padding: const EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return Text(
                                    ingreditientsList[index]!.toString(),
                                    style: StyleConstants.instance.sTitle3,
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Instructions",
                                style: StyleConstants.instance.subTitle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            meal.strInstructions ?? "",
                            style: StyleConstants.instance.sTitle3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        /*  Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          width: displayWidth / 1.3,
                      child: ElevatedButton(
                            onPressed: (() async {
                              if (await canLaunchUrlString(
                                  meal.strYoutube.toString())) {
                                await launchUrlString(
                                    meal.strYoutube.toString());
                              } else {
                                showError("Sorry video not found");
                                throw "could not launch ${meal.strYoutube}";
                              }
                            }),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.orange,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: ColorConstants.instance.black,
                                ),
                                Text(
                                  "Go to youtube video",
                                  style: StyleConstants.instance.sTitle2,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )*/
                        SizedBox(
                          height: displayWidth / 10,
                        ),
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

  Future<dynamic> showError(String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                      style: StyleConstants.instance.sTitle,
                    ))
              ],
              content: Text(message),
            ));
  }
}
