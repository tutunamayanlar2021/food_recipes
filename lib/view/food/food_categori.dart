import 'package:flutter/material.dart';
import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';
import '../../model/food_categori_api/food_categori_model.dart';
import 'food_detail.dart';

class Categori extends StatefulWidget {
  final String kategori;
  final List<Categories> foodCategori;

  const Categori({Key? key, required this.kategori, required this.foodCategori})
      : super(key: key);

  @override
  State<Categori> createState() => _CategoriState();
}

class _CategoriState extends State<Categori> {
  List<Widget> gosterilecekListe = [];
  List<String> foodCategories = [];

  late List<String> categori = [];
  @override
  void initState() {
    super.initState();
    for (var element in widget.foodCategori) {
      /* if (widget.kategori == element.strCategory) {
        gosterilecekListe.add(urunKarti("Zeytin Yağı", "99.99 TL",
            "https://cdn.pixabay.com/photo/2016/05/24/13/29/olive-oil-1412361__340.jpg",
            mevcut: false));
      }*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1, //en boy oranı
        padding: PaddingConstants.instance.paddingAll8,
        children: gosterilecekListe);
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: PaddingConstants.instance.paddingAllNormal,
                child: Hero(
                  tag: resimYolu,
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
            Text(
              isim,
              style: StyleConstants.instance.urunTitle,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                fiyat,
                style: StyleConstants.instance.fiyatTitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
