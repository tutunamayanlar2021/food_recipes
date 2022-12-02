import 'package:flutter/material.dart';
import '../../constants/padding_constant.dart';
import '../../constants/style_constant.dart';

class FoodDetail extends StatelessWidget {
  final String urunAdi;
  final String urunFiyati;
  final String urunAciklama;
  final String urunUrl;
  final bool mevcut;
  const FoodDetail(
      {Key? key,
      required this.urunAdi,
      required this.urunFiyati,
      required this.urunUrl,
      required this.urunAciklama,
      required this.mevcut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: PaddingConstants.instance.paddingAllNormal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  child: Text(urunAdi, style: StyleConstants.instance.desTitle),
                ),
                Text(urunFiyati, style: StyleConstants.instance.mTitle),
                Padding(
                  padding: PaddingConstants.instance.paddingAllNormal,
                  child: Text(urunAciklama,
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
                        child: Text(
                      mevcut ? "Sepete Ekle" : "Stokta Yok",
                      style: StyleConstants.instance.xTitle,
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
