import 'package:flutter/material.dart';
import 'package:shoe_shop/model/product_model.dart';
import 'package:shoe_shop/page/cart_page.dart';
import 'package:badges/badges.dart' as badges;
import 'product_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoeShop extends StatefulWidget {
  const ShoeShop({super.key});

  @override
  State<ShoeShop> createState() => _ShoeShopState();
}

class _ShoeShopState extends State<ShoeShop> {
  List<Products> cartproduct = [];
  int _cartBadgeAmount = 0;
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
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (__) {
                              return ShorpingCart(cartProduct: cartproduct);
                            }));
                          },
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
          ),
          Expanded(
            child: GridView.builder(
                itemCount: productItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final products = productItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (__) {
                                return ProductDetails(products: products);
                              }));
                            },
                            child: Container(
                              height: 240,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade100),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                products.isAdded =
                                                    !products.isAdded;
                                                cartproduct.add(products);
                                                _cartBadgeAmount += 1;
                                              });
                                            },
                                            child: products.isAdded
                                                ? Container()
                                                : Icon(Icons.shopping_cart,
                                                    color: color)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                products.isSelected =
                                                    !products.isSelected;
                                              });
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              color: products.isSelected
                                                  ? color
                                                  : Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      products.imgUlr,
                                      cacheHeight: 120,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    products.title,
                                    style: GoogleFonts.adamina(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    "\$ ${products.price}",
                                    style: GoogleFonts.adamina(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
