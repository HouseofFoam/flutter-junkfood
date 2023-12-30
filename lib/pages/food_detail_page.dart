import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_try/components/introbutton.dart';
import 'package:flutter_application_try/models/food.dart';
import 'package:flutter_application_try/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;
  const FoodDetailPage({super.key, required this.food});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 0;

  void decrementQuantity() {
    setState(() {
      if (quantity != 0) {
        quantity--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(systemNavigationBarColor: primaryColor),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.black),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vestibulum nulla turpis, at placerat neque feugiat a. Suspendisse scelerisque leo et est consectetur ullamcorper. Etiam ac odio sit amet odio varius venenatis vel sit amet tortor. Duis nec nulla efficitur, volutpat tortor ut, interdum tellus. Aenean ornare dolor non ipsum sodales dignissim. Vivamus posuere posuere tortor a maximus. Cras ligula felis, pellentesque et nibh at, condimentum cursus eros. Proin congue magna at lorem gravida commodo in vel orci. Nulla libero nisi, eleifend eget leo id, facilisis ultricies ex. Proin non tempor diam, vulputate sagittis risus. Nam pellentesque metus arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent a dapibus sem, et fringilla eros.",
                  style: TextStyle(color: Colors.grey[600], height: 2),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: decrementQuantity,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ))),
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantity.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: secondaryColor, shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: incrementQuantity,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              )))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              IntroButton(text: "Add to Cart", onTap: () {})
            ]),
          )
        ],
      ),
    );
  }
}
