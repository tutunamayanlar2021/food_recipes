import 'package:flutter/material.dart';
import 'package:food_recipes/model/food_categori_api/food_categori_model.dart';
import 'package:food_recipes/service/food_categori_service.dart';

import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../food/food_categori.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> with SingleTickerProviderStateMixin {
  late TabController _tvController;
  // int indexIcerik = 0;
  late List<Categories> foodCategories = [];
  final List<Widget> _tabs = [];
  List<Widget> catagoryName(List<Categories> foodCategories) {
    for (var element in foodCategories) {
      _tabs.add(Tab(
        child: Text(element.strCategory.toString()),
      ));

      print(" food length:${foodCategories.length}");
      _views.add(Categori(
          kategori: element.strCategory.toString(),
          index: foodCategories.indexOf(element)));
    }

    return _tabs;
  }

  final List<Widget> _views = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      _tvController = TabController(length: 14, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _tabBarWidget(_tabs);
  }

  Widget _tabBarWidget(List<Widget> tabs) => FutureBuilder<List<Categories>?>(
      future: FoodCategoriApiServices().fetchNewsArticle(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Categories> foodCategories = snapshot.data!;

          if (tabs.length == foodCategories.length) {
          } else {
            catagoryName(foodCategories);
          }

          return Column(
            children: [
              TabBar(
                controller: _tvController,
                indicatorColor: const Color(0xFFFEB65C),
                labelColor: const Color(0xFFFEB65C),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                labelStyle: StyleConstants.instance.sTitle,
                tabs: _tabs,
              ),
              Expanded(
                child: Padding(
                  //burada bir container vardı
                  padding: PaddingConstants.instance.paddingAll8,
                  child:
                      TabBarView(controller: _tvController, children: _views),
                ),
              )
            ],
          );
        }
      });
}
