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
List categoriesList = [
  popularFoodList,
  chapathi,
  chinese,
  macaroni,
  frankie,
  meals,
  biriyani,
  sandwich,
  maggie,
  varietyRice,
  juice,
  milkshake,
];

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
              categoriesList[selectedCategoryCard].length,
              (index) => popularFoodCard(
                categoriesList[selectedCategoryCard][index]['imagePath'],
                categoriesList[selectedCategoryCard][index]['name'],
                categoriesList[selectedCategoryCard][index]['price'],
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

const food_Category_List = [
  {
    "imagePath": "images/masala-dosa.png",
    "name": "Breakfast",
  },
  {
    "imagePath": "images/chapathi.png",
    "name": "Chapathi & Parotta",
  },
  {
    "imagePath": "images/fried-rice.png",
    "name": "Chinese",
  },
  {
    'imagePath': 'images/macaroni.png',
    'name': 'Macaroni Pasta',
  },
  {
    'imagePath': 'images/frankie.png',
    'name': 'Frankie',
  },
  {
    'imagePath': 'images/meals.png',
    'name': 'Meals',
  },
  {
    'imagePath': 'images/biryani.png',
    'name': 'Biriyani',
  },
  {
    'imagePath': 'images/sandwich.png',
    'name': 'Sandwich',
  },
  {
    'imagePath': 'images/maggi.png',
    'name': 'Maggi',
  },
  {
    'imagePath': 'images/samosa.png',
    'name': 'Chaat',
  },
  {
    'imagePath': 'images/rice.png',
    'name': 'Variety Rice',
  },
  {
    'imagePath': 'images/juice.png',
    'name': 'Juices',
  },
  {
    'imagePath': 'images/milkshake.png',
    'name': 'Milkshakes',
  },
];
const popularFoodList = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Breakfast', 'price': 28},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Vadai', 'price': 10},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Plain Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Ghee Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Masala Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Podi Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Onion Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Schezwan Dosa', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Paneer Dosa', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Sweet Corn Dosa',
    'price': 60
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Special Kari Dosa',
    'price': 65
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Chicken Dosa', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Uthappam(1 no)',
    'price': 10
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Poori(2 nos)', 'price': 15},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Uthappam(3 nos)',
    'price': 30
  },
];

const chapathi = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Chapathi', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Parotta', 'price': 40},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chilly Parotta',
    'price': 50
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Gobi Parotta', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Parotta',
    'price': 80
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Parotta', 'price': 60},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Parotta',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chapathi(1 no)',
    'price': 15
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Parotta(1 no)', 'price': 20},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chapathi with Chicken',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Parotta with Chicken',
    'price': 80
  },
];

const chinese = [
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Veg Fried Rice',
    'price': 60
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Egg Fried Rice',
    'price': 70
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Fried Rice',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Gobi Fried Rice',
    'price': 70
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Fried Rice',
    'price': 90
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Veg Noodles', 'price': 60},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Noodles', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Noodles',
    'price': 80
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Gobi Noodles', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Noodles',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Veg Fried Rice',
    'price': 70
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Egg Fried Rice',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Paneer Fried Rice',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Gobi Fried Rice',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Chicken Fried Rice',
    'price': 100
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Veg Noodles',
    'price': 70
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Egg Noodles',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Paneer Noodles',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Gobi Noodles',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Chicken Noodles',
    'price': 100
  },
];

const macaroni = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Veg Macaroni', 'price': 60},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Macaroni', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Macaroni',
    'price': 80
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Gobi Macaroni', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Macaroni',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Veg Macaroni',
    'price': 70
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Egg Macaroni',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Paneer Macaroni',
    'price': 90
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Gobi Macaroni',
    'price': 80
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Schezwan Chicken Macaroni',
    'price': 100
  },
];

const biriyani = [
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Plain Biriyani',
    'price': 60
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Biriyani', 'price': 70},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Biriyani',
    'price': 90
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Boiled Egg', 'price': 12},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Masala', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Omelette', 'price': 15},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Double Omelette',
    'price': 25
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Bread Omelette',
    'price': 25
  },
];

const sandwich = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Veg Sandwich', 'price': 35},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Veg Sandwich with cheese',
    'price': 45
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Sandwich', 'price': 40},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Egg Sandwich with cheese',
    'price': 50
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Sandwich',
    'price': 50
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Sandwich with cheese',
    'price': 60
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Gobi Sandwich', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Gobi Sandwich with cheese',
    'price': 60
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Sandwich',
    'price': 50
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Sandwich with cheese',
    'price': 60
  },
];

const frankie = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Veg Frankie', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Frankie', 'price': 40},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Paneer Frankie',
    'price': 60
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Gobi Frankie', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Frankie',
    'price': 70
  },
];

const juice = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Water Melon', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Musk Melon', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Carrot', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Sweet Lime', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Pomogranate', 'price': 50},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Apple', 'price': 50},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Pineapple', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Orange', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Lemon Juice', 'price': 15},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Lemon Soda Salt',
    'price': 20
  },
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Lemon Soda Sweet',
    'price': 20
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Cucumber', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Papaya', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Mixed Juice', 'price': 60},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Chiku', 'price': 50},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Mango', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Iced Lemon Tea',
    'price': 25
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Cold Coffee', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Cold Boost', 'price': 30},
];

const milkshake = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Rose Milk', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Badam Milk', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Strawberry', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Chocolate', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Vannila', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Carrot', 'price': 50},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Cavins', 'price': 35},
];

const maggie = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Veg Maggie', 'price': 30},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Egg Maggie', 'price': 40},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Chicken Maggie',
    'price': 50
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Cheese Maggie', 'price': 40},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Extra Cheese', 'price': 10},
];

const meals = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Meals', 'price': 50},
  {
    'imagePath': 'images/masala-dosa.png',
    'name': 'Unlimited Meals',
    'price': 60
  },
  {'imagePath': 'images/masala-dosa.png', 'name': 'Non Veg Meals', 'price': 70},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Bombay Meals', 'price': 60},
];

const varietyRice = [
  {'imagePath': 'images/masala-dosa.png', 'name': 'Pudhina Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Sambar Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Curd Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Tomato Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Lemon Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Tamarind Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Coconut Rice', 'price': 35},
  {'imagePath': 'images/masala-dosa.png', 'name': 'Carrot Rice', 'price': 35},
];
