import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:badges/badges.dart' as badges;
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

import 'productpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _cartBadgeAmount = 3;
  late bool _showCartBadge;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "D'Lenient",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
        leading: Container(
            margin: const EdgeInsets.only(left: 12),
            decoration:
                BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
            child: const Icon(Icons.menu)),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  color: Colors.grey[100], shape: BoxShape.circle),
              child: badges.Badge(
                showBadge: _showCartBadge,
                badgeContent: Text(
                  _cartBadgeAmount.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                position: badges.BadgePosition.topEnd(top: -4, end: 3),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
              ))
        ],
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.grey.shade200),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'What are you looking for?',
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 25,
                    color: Colors.green,
                  ),
                  RichText(
                    text: const TextSpan(
                        text: "ship to ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Ipapo,Oyo State Nigeria, ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(text: " No 18", style: TextStyle())
                        ]),
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.black,
                size: 35,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCategory(imrUrl: 'assets/images/addidas.png'),
            buildCategory(imrUrl: 'assets/images/nb.png'),
            buildCategory(imrUrl: 'assets/images/nike.png'),
            buildCategory(imrUrl: 'assets/images/vans.png'),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(12),
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/one.jpg',
                  height: 150,
                  width: 150,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Year-end sale",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "up to 90% sales",
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: Colors.green,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Shop now",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrival",
                style: GoogleFonts.adamina(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "see all",
                style: GoogleFonts.roboto(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Expanded(
          child: BuildProductPage(color: color),
        ),
      ]),
    );
  }

  Widget buildCategory({required String imrUrl}) {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 243, 236, 236),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              imrUrl,
            ),
            scale: 5,
          )),
    );
  }
}
