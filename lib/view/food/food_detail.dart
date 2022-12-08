import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/constants/color_constant.dart';
import 'package:food_recipes/service/food_byName_service.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../../cubit/checkBox_cubit.dart';
import '../../model/food_by_name_api.dart/food_byName_api_model.dart';

class FoodDetail extends StatefulWidget {
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
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    List<String> ingredient = [];
    List<List<String>> ing = [];

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Hero(tag: widget.urunUrl, child: Image.network(widget.urunUrl)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              )
            ],
          ),
          mealsDetailWidget(ing)
        ],
      ),
    );
  }

  Widget mealsDetailWidget(List<List<String>> ing) =>
      FutureBuilder<List<MealsByName>?>(
          future: FoodByNameApiServices().fetchNewsArticle(widget.urunAdi),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              List<MealsByName>? food = snapshot.data;

              // ingredient.add(food![0].strMeasure1.toString());
              //  ingredient.add(food[0].strIngredient1.toString());
              ing.add([food![0].strMeasure1.toString()] +
                  [food[0].strIngredient1.toString()] +
                  [food[0].strMeasure2.toString()] +
                  [food[0].strIngredient2.toString()] +
                  [food[0].strMeasure3.toString()] +
                  [food[0].strIngredient3.toString()] +
                  [food[0].strMeasure4.toString()] +
                  [food[0].strIngredient4.toString()] +
                  [food[0].strMeasure5.toString()] +
                  [food[0].strIngredient5.toString()] +
                  [food[0].strMeasure6.toString()] +
                  [food[0].strIngredient6.toString()] +
                  [food[0].strMeasure7.toString()] +
                  [food[0].strIngredient7.toString()] +
                  [food[0].strMeasure8.toString()] +
                  [food[0].strIngredient8.toString()] +
                  [food[0].strMeasure9.toString()] +
                  [food[0].strIngredient9.toString()] +
                  [food[0].strMeasure10.toString()] +
                  [food[0].strIngredient10.toString()]);

              /* for (var i = 0; i < ing.length; i++) {
            return Row(children: [
              Text("${ing[0][i]} ${ing[0][i + 1]}",
                  textAlign: TextAlign.center,
                  style: StyleConstants.instance.des2Title),
            ]);
          }*/
              double displayWidth = MediaQuery.of(context).size.width;
              double displayHeight = MediaQuery.of(context).size.height;

              print(" 1kg beef: $ing");

              print("lunc food:${food[0].strMeal}");
              return Padding(
                padding: PaddingConstants.instance.paddingAllNormal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: PaddingConstants.instance.paddingAllNormal,
                      child: Text(widget.urunAdi,
                          style: StyleConstants.instance.desTitle),
                    ),
                    //   Text(urunFiyati, style: StyleConstants.instance.mTitle),
                    Padding(
                        padding: PaddingConstants.instance.paddingAllNormal,
                        child:
                            /*return Row(children: [
                              Text(
                                  "${ing[0][0]} ${ing[0][1]}\n${ing[0][2]} ${ing[0][3]}\n${ing[0][4]} ${ing[0][5]}\n${ing[0][6]} ${ing[0][7]}\n${ing[0][8]} ${ing[0][9]}\n${ing[0][10]} ${ing[0][11]}\n${ing[0][12]} ${ing[0][13]}\n${ing[0][14]} ${ing[0][15]}\n${ing[0][16]} ${ing[0][17]}\n${ing[0][18]} ${ing[0][19]}",
                                  textAlign: TextAlign.center,
                                  style: StyleConstants.instance.des2Title)
                            ]);*/

                            BlocProvider(
                          create: (context) => CheckBoxCubit(),
                          child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              // margin: EdgeInsets.all(displayWidth * .03),

                              //height: displayWidth * .1000,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorConstants.instance.blackSkin,
                                      blurRadius: 2,
                                      offset: const Offset(0, 0)),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Row(children: [
                                BlocBuilder<CheckBoxCubit, bool>(
                                  builder: (context, state) {
                                    return Checkbox(
                                        activeColor: const Color(0xFFCAE3F1),
                                        // checkColor: const Color(0xFFCAE3F1),
                                        // focusColor: const Color(0xFFCAE3F1),

                                        value: state,
                                        onChanged: (bool? value) {
                                          if (state == false) {
                                            context
                                                .read<CheckBoxCubit>()
                                                .isSelected();
                                          } else {
                                            context
                                                .read<CheckBoxCubit>()
                                                .isnotSelected();
                                          }
                                        });
                                  },
                                ),
                                Text("${ing[0][0]} ${ing[0][1]}",
                                    textAlign: TextAlign.center,
                                    style: StyleConstants.instance.des2Title)
                              ]))),
                        )

                        /* child: Column(
                        children: [
                          icindekiler(ing, ing.first.length),
                          /*Row(children: [
                            Text("${ing[0][0]} ${ing[0][1]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][2]} ${ing[0][3]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][4]} ${ing[0][5]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][6]} ${ing[0][7]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][8]} ${ing[0][9]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][10]} ${ing[0][11]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][12]} ${ing[0][13]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][12]} ${ing[0][13]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][12]} ${ing[0][13]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),
                          Row(children: [
                            Text("${ing[0][12]} ${ing[0][13]}",
                                textAlign: TextAlign.center,
                                style: StyleConstants.instance.des2Title),
                          ]),*/
                        ],
                      ),*/
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
                          color: widget.mevcut ? Colors.orange : Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: MaterialButton(
                          onPressed: () async {
                            try {
                              await launchUrlString(
                                  food[0].strYoutube.toString());
                            } catch (e) {
                              if (e.toString().contains("ACTIVITY_NOT_FOUND")) {
                                showError(
                                    "Video is not accessible for this meal",
                                    context);
                              }
                              print(e.toString());
                            }
                          },
                          child: Text("Go to youtube video"),
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
