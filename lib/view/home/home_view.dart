import 'package:flutter/material.dart';
import '../../constants/style_constant.dart';
import '../food_api/FoodTabScreen.dart';
import '../search/SearchScreen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Widget> _contents;
  late int indexContents = 0;
  @override
  void initState() {
    _contents = [const FoodTabScreen(), SearchScreen()];
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
          indexContents == 0 ? "Foody" : "",
          style: StyleConstants.instance.lTitle,
        ),
      ),
      body: _contents[indexContents],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexContents,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
        onTap: (int buttonNo) {
          setState(() {
            indexContents = buttonNo;
          });
        },
      ),
    );
  }
}
