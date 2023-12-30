import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_try/components/introbutton.dart';
import 'package:flutter_application_try/models/food.dart';
import 'package:flutter_application_try/pages/food_detail_page.dart';
import 'package:flutter_application_try/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/foodtile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List food = [
    Food(
        name: "Pizza",
        price: "39.90",
        imagePath: 'lib/food_assets/pizza.png',
        rating: "4.5"),
    Food(
        name: "Double Cheeseburger",
        price: "25.00",
        imagePath: 'lib/food_assets/burger.png',
        rating: "4.9"),
    Food(
        name: "Fried Chicken",
        price: "21.00",
        imagePath: 'lib/food_assets/fried_chicken.png',
        rating: "4.7"),
    Food(
        name: "Fried Potatoes",
        price: "15.00",
        imagePath: 'lib/food_assets/fried_potatoes.png',
        rating: "4.8"),
    Food(
        name: "Soda",
        price: "5.00",
        imagePath: 'lib/food_assets/soda.png',
        rating: "5")
  ];

  void navigateToFoodDetail(int foodIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(
          food: food[foodIndex],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey[200]),
        title: Text("JUNK FOODS",
            style:
                GoogleFonts.dmSerifDisplay(fontSize: 28, color: primaryColor)),
        leading: const Icon(
          Icons.menu,
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Get 25% Off',
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 28, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      IntroButton(text: "Redeem", onTap: () {}),
                    ],
                  ),
                  Image.asset(
                    'lib/food_assets/burger.png',
                    height: 80,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                      prefixIconColor: Colors.grey[400]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                itemBuilder: (context, index) => FoodTile(
                  food: food[index],
                  onTap: () {
                    navigateToFoodDetail(index);
                  },
                ),
                itemCount: food.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Trending Food",
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 25),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    food[4].imagePath,
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food[4].name,
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        Text(
                          '\$' + food[4].price,
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
