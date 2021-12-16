import 'package:flutter/material.dart';
import 'package:sdlad_fos/constants.dart';
import 'package:sdlad_fos/utilities/menuText.dart';
import 'package:sdlad_fos/utilities/navigationDrawerWidget.dart';

import 'cartpage.dart';

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
  chaat,
  juice,
  milkshake,
];
List cartItems = [];

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
        iconTheme: const IconThemeData(color: kDarkssn),
        title: const menuText(
          text: 'MENU',
          size: 23,
          color: Colors.black,
          // fontWeight: FontWeight.w500,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              color: kDarkssn,
              size: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartPage(cartItems: cartItems)));
              //Navigator.pushNamed(context, CartPage.id, arguments: cartItems);
            },
            child: const Padding(
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
            padding: const EdgeInsets.only(left: 20, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                menuText(
                  text: "Hello Aravintharaj !",
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          const Padding(
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
        margin: const EdgeInsets.only(right: 25, top: 20, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCategoryCard == index
              ? const Color(0XFFFFB606)
              : const Color(0XFF0066B4),
          boxShadow: const [
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
              shape: const CircleBorder(),
              child: Icon(
                Icons.arrow_downward_outlined,
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

Widget popularFoodCard(String imagePath, String name, int price) {
  return Container(
    margin: const EdgeInsets.only(right: 20, left: 15, top: 25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [BoxShadow(blurRadius: 5, color: Colors.grey)],
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
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
                  child: Image(fit: BoxFit.cover, image: AssetImage(imagePath)),
                ),
              ),
              const SizedBox(
                width: 15.0,
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
                        size: 15.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.star, color: Colors.orange, size: 17),
                        Icon(Icons.star, color: Colors.orange, size: 17),
                        Icon(Icons.star, color: Colors.orange, size: 17),
                        Icon(Icons.star, color: Colors.orange, size: 17),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      children: <Widget>[
                        menuText(
                          text: "₹ $price",
                          color: kDarkssn,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: kInactiveColor,
                  child: IconButton(
                      icon: const Icon(Icons.add),
                      color: kDarkssn,
                      onPressed: () {
                        cartItems.add({
                          'imagePath': imagePath,
                          'name': name,
                          'price': price,
                        });
                        print(cartItems);
                      }))),
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
    "imagePath": "images/icons8-naan-64.png",
    "name": "Parotta",
  },
  {
    "imagePath": "images/chinese.png",
    "name": "Chinese",
  },
  {
    "imagePath": "images/icons8-pasta-64.png",
    "name": " Pasta ",
  },
  {
    "imagePath": "images/icons8-wrap-48.png",
    "name": " Frankie ",
  },
  {
    "imagePath": "images/icons8-bento-box-48.png",
    "name": " Meals ",
  },
  {
    "imagePath": "images/fried-rice.png",
    "name": " Biriyani ",
  },
  {
    "imagePath": "images/icons8-sandwich-48.png",
    "name": "Sandwich",
  },
  {
    "imagePath": "images/icons8-spaghetti-48.png",
    "name": " Maggi ",
  },
  {
    "imagePath": "images/meals.png",
    "name": "Variety"
        " Rice",
  },
  {
    "imagePath": "images/icons8-samosa-48.png",
    "name": " Chaat ",
  },
  {
    "imagePath": "images/icons8-orange-juice-48.png",
    "name": "Juices",
  },
  {
    "imagePath": "images/milkshake.png",
    "name": "Milkshakes",
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
  {'imagePath': 'images/icons8-naan-64.png', 'name': 'Chapathi', 'price': 30},
  {'imagePath': 'images/icons8-naan-64.png', 'name': 'Parotta', 'price': 40},
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Chilly Parotta',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Gobi Parotta',
    'price': 70
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Paneer Parotta',
    'price': 80
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Egg Parotta',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Chicken Parotta',
    'price': 90
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Chapathi(1 no)',
    'price': 15
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Parotta(1 no)',
    'price': 20
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Chapathi with Chicken',
    'price': 80
  },
  {
    'imagePath': 'images/icons8-naan-64.png',
    'name': 'Parotta with Chicken',
    'price': 80
  },
];

const chinese = [
  {'imagePath': 'images/chinese.png', 'name': 'Veg Fried Rice', 'price': 60},
  {'imagePath': 'images/chinese.png', 'name': 'Egg Fried Rice', 'price': 70},
  {'imagePath': 'images/chinese.png', 'name': 'Gobi Fried Rice', 'price': 70},
  {
    'imagePath': 'images/chinese.png',
    'name': 'Chicken Fried Rice',
    'price': 90
  },
  {'imagePath': 'images/chinese.png', 'name': 'Veg Noodles', 'price': 60},
  {'imagePath': 'images/chinese.png', 'name': 'Egg Noodles', 'price': 70},
  {'imagePath': 'images/chinese.png', 'name': 'Paneer Noodles', 'price': 80},
  {'imagePath': 'images/chinese.png', 'name': 'Gobi Noodles', 'price': 70},
  {'imagePath': 'images/chinese.png', 'name': 'Chicken Noodles', 'price': 90},
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Veg Fried Rice',
    'price': 70
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Egg Fried Rice',
    'price': 80
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Paneer Fried Rice',
    'price': 90
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Gobi Fried Rice',
    'price': 80
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schn Chicken FriedRice',
    'price': 100
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Veg Noodles',
    'price': 70
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Egg Noodles',
    'price': 80
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Paneer Noodles',
    'price': 90
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Gobi Noodles',
    'price': 80
  },
  {
    'imagePath': 'images/chinese.png',
    'name': 'Schezwan Chicken Noodles',
    'price': 100
  },
  {
    'imagePath': 'iimages/chinese.png',
    'name': 'Paneer Fried Rice',
    'price': 80
  },
];

const macaroni = [
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Veg Macaroni',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Egg Macaroni',
    'price': 70
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Paneer Macaroni',
    'price': 80
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Gobi Macaroni',
    'price': 70
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Chicken Macaroni',
    'price': 90
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Schezwan Veg Macaroni',
    'price': 70
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Schezwan Egg Macaroni',
    'price': 80
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Schezwan Paneer Macaroni',
    'price': 90
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Schezwan Gobi Macaroni',
    'price': 80
  },
  {
    'imagePath': 'images/icons8-pasta-64.png',
    'name': 'Schn Chicken Macaroni',
    'price': 100
  },
];

const biriyani = [
  {'imagePath': 'images/fried-rice.png', 'name': 'Plain Biriyani', 'price': 60},
  {'imagePath': 'images/fried-rice.png', 'name': 'Egg Biriyani', 'price': 70},
  {
    'imagePath': 'images/fried-rice.png',
    'name': 'Chicken Biriyani',
    'price': 90
  },
  {'imagePath': 'images/fried-rice.png', 'name': 'Boiled Egg', 'price': 12},
  {'imagePath': 'images/fried-rice.png', 'name': 'Egg Masala', 'price': 30},
  {'imagePath': 'images/fried-rice.png', 'name': 'Omelette', 'price': 15},
  {
    'imagePath': 'images/fried-rice.png',
    'name': 'Double Omelette',
    'price': 25
  },
];

const sandwich = [
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Veg Sandwich',
    'price': 35
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Veg Sandwich with cheese',
    'price': 45
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Egg Sandwich',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Egg Sandwich with cheese',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Paneer Sandwich',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Paneer Sandwich & cheese',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Gobi Sandwich',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Gobi Sandwich with cheese',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Chicken Sandwich',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-sandwich-48.png',
    'name': 'Chicken Sandwich & cheese',
    'price': 60
  },
];

const frankie = [
  {
    'imagePath': 'images/icons8-wrap-48.png',
    'name': 'Veg Frankie',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-wrap-48.png',
    'name': 'Egg Frankie',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-wrap-48.png',
    'name': 'Paneer Frankie',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-wrap-48.png',
    'name': 'Gobi Frankie',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-wrap-48.png',
    'name': 'Chicken Frankie',
    'price': 70
  },
];

const juice = [
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Water Melon',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Musk Melon',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Carrot',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Sweet Lime',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Pomogranate',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Apple',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Pineapple',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Orange',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Lemon Juice',
    'price': 15
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Lemon Soda Salt',
    'price': 20
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Lemon Soda Sweet',
    'price': 20
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Cucumber',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Papaya',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Mixed Juice',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Chiku',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Mango',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Iced Lemon Tea',
    'price': 25
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Cold Coffee',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-orange-juice-48.png',
    'name': 'Cold Boost',
    'price': 30
  },
];

const milkshake = [
  {'imagePath': 'images/milkshake.png', 'name': 'Rose Milk', 'price': 30},
  {'imagePath': 'images/milkshake.png', 'name': 'Badam Milk', 'price': 30},
  {'imagePath': 'images/milkshake.png', 'name': 'Strawberry', 'price': 35},
  {'imagePath': 'images/milkshake.png', 'name': 'Chocolate', 'price': 35},
  {'imagePath': 'images/milkshake.png', 'name': 'Vannila', 'price': 35},
  {'imagePath': 'images/milkshake.png', 'name': 'Carrot', 'price': 50},
  {'imagePath': 'images/milkshake.png', 'name': 'Cavins', 'price': 35},
];

const maggie = [
  {
    'imagePath': 'images/icons8-spaghetti-48.png',
    'name': 'Veg Maggie',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-spaghetti-48.png',
    'name': 'Egg Maggie',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-spaghetti-48.png',
    'name': 'Chicken Maggie',
    'price': 50
  },
  {
    'imagePath': 'images/icons8-spaghetti-48.png',
    'name': 'Cheese Maggie',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-spaghetti-48.png',
    'name': 'Extra Cheese',
    'price': 10
  },
];

const meals = [
  {'imagePath': 'images/icons8-bento-box-48.png', 'name': 'Meals', 'price': 50},
  {
    'imagePath': 'images/icons8-bento-box-48.png',
    'name': 'Unlimited Meals',
    'price': 60
  },
  {
    'imagePath': 'images/icons8-bento-box-48.png',
    'name': 'Non Veg Meals',
    'price': 70
  },
  {
    'imagePath': 'images/icons8-bento-box-48.png',
    'name': 'Bombay Meals',
    'price': 60
  },
];

const varietyRice = [
  {'imagePath': 'images/meals.png', 'name': 'Pudhina Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Sambar Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Curd Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Tomato Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Lemon Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Tamarind Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Coconut Rice', 'price': 35},
  {'imagePath': 'images/meals.png', 'name': 'Carrot Rice', 'price': 35},
];

const chaat = [
  {'imagePath': 'images/icons8-samosa-48.png', 'name': 'Samosa', 'price': 10},
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Chenna Samosa',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Bhel Puri',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Aalo Puri',
    'price': 40
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Dahi Puri',
    'price': 45
  },
  {'imagePath': 'images/icons8-samosa-48.png', 'name': 'Sev Puri', 'price': 40},
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Paani Puri',
    'price': 25
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Masala Puri',
    'price': 35
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Chenna Masala',
    'price': 30
  },
  {
    'imagePath': 'images/icons8-samosa-48.png',
    'name': 'Dahi Papdi Chaat',
    'price': 45
  },
  {
    'imagePath': 'images/icons8-samosa-48.png `',
    'name': 'Pav Bhaji',
    'price': 50
  },
];
