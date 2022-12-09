import 'package:flutter/material.dart';
import '../../constants/style_constant.dart';
import '../food_api/FoodTabScreen.dart';

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
    _icerikler = [const FoodTabScreen(), Container()];
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
          "Food Recipe",
          style: StyleConstants.instance.lTitle,
        ),
      ),
      body: _icerikler[indexIcerik],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexIcerik,
        selectedItemColor: Colors.orange,
        unselectedItemColor: const Color(0xFFCAE3F1),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.filter_list), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: "Sepetim"),
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
