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
  late TabController tvController;
  // int indexIcerik = 0;
  late List<Categories> foodCategories = [];
  @override
  void initState() {
    super.initState();

    tvController = TabController(length: 14, vsync: this);
  }

  final List<Tab> _tabs = [];

  final List<Widget> _views = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: foodCategories.length,
      child: FutureBuilder<List<Categories>?>(
          future: FoodCategoriApiServices().fetchNewsArticle(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Categories> foodCategories = snapshot.data!;

              for (var element in foodCategories) {
                _tabs.add(Tab(
                  child: Text(element.strCategory.toString()),
                ));
                _views.add(Categori(
                  kategori: element.strCategory.toString(),
                  foodCategori: [element],
                ));
              }

              return Column(
                children: [
                  TabBar(
                    controller: tvController,
                    indicatorColor: Colors.orange,
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelStyle: StyleConstants.instance.sTitle,
                    tabs: _tabs,
                  ),
                  Expanded(
                    child: Padding(
                      //burada bir container vardı
                      padding: PaddingConstants.instance.paddingAll8,
                      child: TabBarView(
                          controller: tvController, children: _views),
                    ),
                  )
                ],
              );
            }
          }),
    );
  }
}
