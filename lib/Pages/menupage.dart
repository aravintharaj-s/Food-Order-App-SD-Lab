import 'package:flutter/material.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'cartpage.dart';
import 'package:sdlad_fos/utilities/navigationDrawerWidget.dart';

class MenuPage extends StatefulWidget {
  static String id = 'Menu_page';
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

int selectedCategoryCard = 0;

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kInactiveColor,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        /*leading: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(Icons.view_headline_rounded, color: kDarkssn, size: 25),
        ),*/
        iconTheme: IconThemeData(color: kDarkssn),
        title: menuText(
          text: 'MENU',
          size: 23,
          color: Colors.black,
          // fontWeight: FontWeight.w500,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.search,
              color: kDarkssn,
              size: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CartPage.id);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 8.0),
              child: Icon(Icons.shopping_cart, color: kDarkssn, size: 25),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: kInactiveColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                menuText(
                  text: "Hello Aravintharaj !",
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: menuText(
              text: "Categories",
              //  fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: food_Category_List.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                child: food_Category_Card(
                    food_Category_List[index]["imagePath"],
                    food_Category_List[index]["name"],
                    index),
              ),
            ),
          ),
          Column(
            children: List.generate(
              popularFoodList.length,
              (index) => popularFoodCard(
                popularFoodList[index]['imagePath'],
                popularFoodList[index]['name'],
                popularFoodList[index]['price'],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget food_Category_Card(var imagePath, var name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategoryCard = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCategoryCard == index
              ? Color(0XFFFFB606)
              : Color(0XFF0066B4),
          boxShadow: [
            BoxShadow(color: Colors.white54, blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              width: 65,
            ),
            menuText(
              text: name,
              size: 20,
              fontWeight: FontWeight.w500,
              color: kInactiveColor,
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor:
                  selectedCategoryCard == index ? kDarkssn : kInactiveColor,
              shape: CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color:
                    selectedCategoryCard == index ? Colors.white : Colors.black,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget popularFoodCard(var imagePath, var name, var price) {
  return Container(
    margin: EdgeInsets.only(right: 25, left: 20, top: 25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // width: 300.0,
            child: Row(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: kInactiveColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image(fit: BoxFit.cover, image: AssetImage(imagePath)),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: menuText(
                          text: name,
                          fontWeight: FontWeight.w600,
                          size: 17.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                          Icon(Icons.star, color: Colors.orange, size: 17),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: <Widget>[
                          menuText(
                            text: "₹ $price",
                            color: kDarkssn,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: kInactiveColor,
                  child: IconButton(
                      icon: Icon(Icons.add),
                      color: kDarkssn,
                      onPressed: () {}))),
        ],
      ),
    ),
  );
}
