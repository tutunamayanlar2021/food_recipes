import 'package:flutter/material.dart';
import 'package:food_recipes/view/food_api/food_api_view.dart';
import '../../constants/style_constant.dart';
import '../food_api/food.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _icerikler;
  late int indexIcerik = 0;
  @override
  void initState() {
    _icerikler = [const Food(), FoodView()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.orange),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Uçarak Gelsin",
          style: StyleConstants.instance.lTitle,
        ),
      ),
      body: _icerikler[indexIcerik],
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            UserAccountsDrawerHeader(
              arrowColor: Colors.amber,
              accountName: const Text("Kader"),
              accountEmail: const Text("kaderoral2147@gmail.com"),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/11/22/06/05/girl-1848454__340.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              decoration: const BoxDecoration(color: Colors.orange),
            ),
            ListTile(
              title: const Text("Siparişlerim"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("İndirim Kuponlarım"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Ayarlar"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexIcerik,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Sepetim"),
        ],
        onTap: (int buttonNo) {
          setState(() {
            indexIcerik = buttonNo;
          });
        },
      ),
    );
  }
}
