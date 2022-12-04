import 'package:flutter/material.dart';
import 'package:food_recipes/model/food_by_categori_api/food_by_categori_model.dart';
import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../../model/food_categori_api/food_categori_model.dart';
import '../../service/food_categori_service.dart';
import '../../service/foof_byCategori_service.dart';
import 'food_detail.dart';

class Categori extends StatefulWidget {
  final String kategori;
  final int index;

  const Categori({Key? key, required this.kategori, required this.index})
      : super(key: key);

  @override
  State<Categori> createState() => _CategoriState();
}

class _CategoriState extends State<Categori> {
  List<Widget> gosterilecekListe = [];

  @override
  void initState() {
    super.initState();
    //foodIndex(widget.index);
  }

//
  @override
  Widget build(BuildContext context) {
    return getFoodName(widget.index);
  }

  Widget getFoodName(int index) => FutureBuilder<List<Categories>?>(
      future: FoodCategoriApiServices().fetchNewsArticle(),
      builder: ((context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          List<Categories>? foodName = snapshot.data;
          List<String> nameofFood = [];
          for (var element in foodName!) {
            nameofFood.add(element.strCategory.toString());
          }

          // print(foodName.length);

          return showFood(nameofFood, index);
        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }));

  Widget showFood(List<String> foodName, int index) =>
      FutureBuilder<List<Meal>?>(
          future: FoodByCategoriApiServices().fetchNewsArticle(foodName, index),
          builder: ((context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              List<Meal>? foodCategories = snapshot.data;

              if (widget.kategori == foodName[index]) {
                for (var element in foodCategories!) {
                  gosterilecekListe.add(urunKarti(
                      element.strMeal.toString(),
                      element.idMeal.toString(),
                      element.strMealThumb.toString(),
                      mevcut: true));
                }

                index++;

                // print(index);
              }

              // print(index);

/* while (index < foodName.length) {
            if (widget.kategori == foodName[index]) {
              for (var element in foodCategories!) {
                gosterilecekListe.add(urunKarti(
                    element.strMeal.toString(),
                    element.strMealThumb.toString(),
                    element.strMealThumb.toString(),
                    mevcut: true));
              }
            }
            index++;
          }*/
              return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                  childAspectRatio: 1, //en boy oranı
                  padding: PaddingConstants.instance.paddingAll8,
                  children: gosterilecekListe);
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }));
  Widget urunKarti(String isim, String fiyat, String resimYolu,
      {bool mevcut = true}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetail(
                urunAciklama: "Bu kısımda ürün açıklaması olucak",
                urunAdi: isim,
                urunFiyati: fiyat,
                urunUrl: resimYolu,
                mevcut: mevcut,
              ),
            )); //take us to the detail page
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
                padding: PaddingConstants.instance.paddingAllNormal,
                child: Hero(
                  tag: isim,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(resimYolu), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 5),
              child: Text(
                isim,
                style: StyleConstants.instance.urunTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
