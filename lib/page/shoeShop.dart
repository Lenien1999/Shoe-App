// ignore: file_names
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:badges/badges.dart' as badges;

class ShoeShop extends StatefulWidget {
  const ShoeShop({super.key});

  @override
  State<ShoeShop> createState() => _ShoeShopState();
}

class _ShoeShopState extends State<ShoeShop> {
  final int _cartBadgeAmount = 3;
  // late bool _showCartBadge;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 216, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 216, 216),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration:
                BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
            child: Image.asset(
              "assets/images/two.png",
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 2.4 / 3,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      color: Colors.grey[100], shape: BoxShape.circle),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (__) {
                      //   return ShorpingCart(cartproduct: ca,);
                      // }));
                    },
                    child: badges.Badge(
                      // showBadge: _showCartBadge,
                      badgeContent: Text(
                        _cartBadgeAmount.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      position: badges.BadgePosition.topEnd(top: -4, end: 3),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart)),
                    ),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "New Arrivals",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
