import 'package:flutter/material.dart';
import 'package:food_recipes/models/Category.dart';
import 'package:food_recipes/service/FoodAPIService.dart';

import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../food/CategoryScreen.dart';

class FoodTabScreen extends StatefulWidget {
  const FoodTabScreen({Key? key}) : super(key: key);

  @override
  State<FoodTabScreen> createState() => _FoodTabScreenState();
}

class _FoodTabScreenState extends State<FoodTabScreen>
    with SingleTickerProviderStateMixin {
  FoodAPIService foodAPIService = FoodAPIService();

  late TabController _tvController;
  Category? categoryList;

  @override
  void initState() {
    super.initState();
    getFoodCategories();
  }

  void getFoodCategories() async {
    categoryList = await foodAPIService.getFoodCategories();
    setState(() {
      _tvController = TabController(
          length: categoryList?.categories?.length ?? 0, vsync: this);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (categoryList?.categories?.isNotEmpty ?? false) {
      return Column(
        children: [
          TabBar(
            controller: _tvController,
            indicatorColor: const Color(0xFFFEB65C),
            labelColor: const Color(0xFFFEB65C),
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelStyle: StyleConstants.instance.sTitle,
            tabs: categoryList!.categories?.map((element) {
                  return Tab(
                    child: Text(element.strCategory ?? ""),
                  );
                }).toList() ??
                [],
          ),
          Expanded(
            child: Padding(
              //burada bir container vardı
              padding: PaddingConstants.instance.paddingAll8,
              child: TabBarView(
                controller: _tvController,
                children: categoryList!.categories?.map((element) {
                      return CategoryScreen(
                        categoryName: element.strCategory,
                      );
                    }).toList() ??
                    [],
              ),
            ),
          )
        ],
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
