import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';
import '../../model/food_api/food_api_model.dart';
import '../../service/food_api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: displayHeight / 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth / 30),
            child: const Text(
              "Daily News",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          getData(displayWidth),
        ],
      ),
    );
  }

  Widget getData(double displayWidth) => Expanded(
        child: FutureBuilder<List<Meals>?>(
            future: FoodApiServices().fetchNewsArticle(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Meals> foodArticle = snapshot.data!;
                return ListView.builder(
                    //shrinkWrap: true,
                    //physics: const BouncingScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: foodArticle.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: ColorConstants.instance.blackSkin
                                      .withOpacity(0.8),
                                  blurRadius: 0.1,
                                  spreadRadius: 0.1,
                                  offset: Offset(1, 5)),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            minVerticalPadding: 6,
                            onTap: (() async {
                              if (await canLaunchUrlString(
                                  foodArticle[index].strYoutube.toString())) {
                                await launchUrlString(snapshot
                                    .data![index].strYoutube
                                    .toString());
                              } else {
                                throw "could not launch ${snapshot.data![index].strYoutube}";
                              }
                            }),
                            title: Text(
                              foodArticle[index].strMeal.toString(),
                            ),
                            subtitle: Text(
                              foodArticle[index].strCategory.toString(),
                            ),
                            leading: foodArticle[index].strMealThumb != null
                                ? Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data![index].strMealThumb
                                                .toString()))),
                                  )
                                : null,
                          ),
                        ),
                      );
                    });
              }
            }),
      );
}
