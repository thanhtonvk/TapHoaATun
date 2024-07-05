import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tap_hoa_atun/constants.dart';

import 'models/food.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  Widget header() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hello các tình yêu 💕",
          style: TextStyle(
              color: Color.fromARGB(255, 245, 0, 87),
              fontWeight: FontWeight.normal,
              fontSize: 30),
        ),
        Text(
          "Hôm nay tình yêu muốn ăn gì nào?",
          style: TextStyle(
              color: Color.fromARGB(255, 240, 98, 146),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  TextEditingController txtSearch = TextEditingController();

  Widget searchBar() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        labelText: "Tình yêu muốn tìm món gì nà <3",
        labelStyle: const TextStyle(color: Color.fromARGB(255, 173, 20, 87)),
        floatingLabelStyle:
            const TextStyle(height: 4, color: Color.fromARGB(100, 233, 30, 99)),
        filled: true,
        fillColor: const Color.fromARGB(100, 231, 231, 231),
        prefixIcon: const Icon(
          Icons.search,
          color: Color.fromARGB(255, 136, 14, 79),
        ),
      ),
    );
  }

  Widget items(Food food) {
    return Card(
        color: Color.fromARGB(255, 252, 228, 236),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 252, 228, 236),
                radius: 50,
                backgroundImage: AssetImage(food.Image.toString()),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      food.Name.toString(),
                      style: TextStyle(
                          color: Color.fromARGB(255, 194, 24, 91),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "${food.Cost.toString()} đ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 216, 27, 96),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      "Số lượng: ${food.Quantity.toString()}",
                      style: TextStyle(
                          color: Color.fromARGB(255, 216, 27, 96),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),

                  ],
                ),
              )
            ],
          ),
        ));
  }

  List<Food> foodList = [
    Food(1, 1, "Bim bim khoai tay ", "Size", 1, "images/snack_khoai_tay.jpg",
        "Type")
  ];

  Widget snack() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Đồ ăn vặt",
          style: TextStyle(
              color: Color.fromARGB(255, 240, 98, 146),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          children: foodList.map((food) {
            return items(food);
          }).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(100, 252, 228, 236),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            const SizedBox(
              height: 20,
            ),
            searchBar(),
            const SizedBox(
              height: 20,
            ),
            snack()
          ],
        ),
      ),
    );
  }
}
