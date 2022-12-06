import 'package:flutter/material.dart';
import 'package:food_recipes/service/food_byName_service.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../../model/food_by_name_api.dart/food_byName_api_model.dart';

class FoodDetail extends StatelessWidget {
  final String urunAdi;

  final String urunAciklama;
  final String urunUrl;
  final bool mevcut;

  const FoodDetail({
    Key? key,
    required this.urunAdi,
    required this.urunUrl,
    required this.urunAciklama,
    required this.mevcut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> ingredient = [];
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(tag: urunUrl, child: Image.network(urunUrl)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              )
            ],
          ),
          mealsDetailWidget(ingredient)
        ],
      ),
    );
  }

  Widget mealsDetailWidget(List<String> ingredient) => FutureBuilder<
          List<MealsByName>?>(
      future: FoodByNameApiServices().fetchNewsArticle(urunAdi),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          List<MealsByName>? food = snapshot.data;
          ingredient.add(food![0].strMeasure1.toString());
          ingredient.add(food[0].strIngredient1.toString());

          print("lunc food:${food[0].strMeal}");
          return Padding(
            padding: PaddingConstants.instance.paddingAllNormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  child: Text(urunAdi, style: StyleConstants.instance.desTitle),
                ),
                //   Text(urunFiyati, style: StyleConstants.instance.mTitle),
                Padding(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  child: Column(
                    children: [
                      Row(children: [
                        Text((ingredient[0] + " " + ingredient[1]).toString(),
                            textAlign: TextAlign.center,
                            style: StyleConstants.instance.des2Title),
                      ]),
                      /* Row(children: [
                        Text((food[0].strMeasure2).toString(),
                            textAlign: TextAlign.center,
                            style: StyleConstants.instance.des2Title),
                        Text(food[0].strIngredient2.toString(),
                            textAlign: TextAlign.center,
                            style: StyleConstants.instance.des2Title),
                      ]),*/
                    ],
                  ),
                ),
                Padding(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  child: Text(food[0].strInstructions.toString(),
                      textAlign: TextAlign.center,
                      style: StyleConstants.instance.des2Title),
                ),
                Padding(
                  padding: PaddingConstants.instance.paddingAll8,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50,
                    decoration: BoxDecoration(
                      color: mevcut ? Colors.orange : Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: MaterialButton(
                      onPressed: () async {
                        try {
                          await launchUrlString(food[0].strYoutube.toString());
                        } catch (e) {
                          if (e.toString().contains("ACTIVITY_NOT_FOUND")) {
                            showError("Video is not accessible for this meal",
                                context);
                          }
                          print(e.toString());
                        }
                        /* if (await canLaunchUrlString(
                            food[0].strYoutube.toString())) {
                          await launchUrlString(food[0].strYoutube.toString());
                          print("lunc index:");
                        } else {
                          showError("message", context);

                          throw "could not launch ${food[0].strYoutube.toString().toString()}";
                        }*/
                      },
                      child: Text("Yotube"),
                    )),
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
  Future<dynamic> showError(String message, BuildContext context) {
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
        // title: const Text("Hata!"),
        // contentPadding: EdgeInsets.all(10),
        content: Text(message, style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}
