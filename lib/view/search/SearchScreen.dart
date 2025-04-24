import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_recipes/constants/color_constant.dart';
import '../../models/Meal.dart';
import '../../service/FoodAPIService.dart';
import '../food/FoodDetailScreenn.dart';

class SearchScreen extends StatefulWidget {
  final String? foodID;

  const SearchScreen({super.key, this.foodID});

  @override
  State<SearchScreen> createState() => _SEarchScreenState();
}

class _SEarchScreenState extends State<SearchScreen> {
  FoodAPIService foodAPIService = FoodAPIService();
  List<Meals?>? searchOfMeals = [];
  List<Meals?>? mealList = [];
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textEditingController = TextEditingController();
    // _textEditingController.dispose();
  }

  void search(String value) {
    for (var meal in mealList!) {
      if (meal!.strMeal!.toLowerCase().trim().contains(value.trim())) {
        searchOfMeals!.add(meal);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: _textEditingController,
            textInputAction: TextInputAction.search,
            onSubmitted: ((value) {
              search(value);

              log(searchOfMeals!.length.toString());
            }),
            decoration: InputDecoration(
              //contentPadding: EdgeInsetsDirectional.all(1),
              suffixIcon: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.0),
                      elevation: 0),
                  onPressed: () {
                    searchOfMeals!.clear();
                    _textEditingController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                  label: Text("")),
              filled: true,
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: "Search for meal",
              fillColor: Color(0xFFF6F6F6),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<Meals?>>(
            future: foodAPIService.getFoodAll(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchOfMeals!.isNotEmpty
                          ? searchOfMeals!.length
                          : snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        mealList = snapshot.data;
                        var item = searchOfMeals!.isNotEmpty
                            ? searchOfMeals![index]
                            : snapshot.data![index];

                        return GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodDetailScreen(
                                    foodID: item!.idMeal,
                                  ),
                                ));
                          }),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: Offset(0, 5),
                                      spreadRadius: 1)
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Container(
                                      //padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              item!.strMealThumb ?? ""),
                                        ),
                                      ),
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Text(
                                          item.strMeal ?? "",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.orange,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: ColorConstants.instance.blue,
                                          ),
                                          Text(
                                            item.strArea ?? "",
                                            style: const TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        item.strTags ?? "",
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                        );
                      })),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }))
      ],
    );
  }
}
/*    */