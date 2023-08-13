import 'package:flutter/material.dart';

import 'package:shoe_shop/model/product_model.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:shoe_shop/page/homepage.dart';

class ProductDetails extends StatefulWidget {
  final Products products;
  const ProductDetails({super.key, required this.products});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final imageList = [
    'assets/images/five.png',
    'assets/images/four.png',
    'assets/images/three.png',
    'assets/images/two.png'
  ];
  bool isSelected = false;
  int clickedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height * 1.2 / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 240, 231, 231)),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (__) {
                              return const HomePage();
                            }));
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Text(widget.products.title.toUpperCase(),
                          style: GoogleFonts.adamina(
                              textStyle: const TextStyle(
                                  letterSpacing: 1.0, color: Colors.black),
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert))
                    ]),
                Positioned(
                  bottom: 22,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.77,
                    height: MediaQuery.of(context).size.height * 0.27,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.products.imgUlr),
                            scale: 1)),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                imageList.length,
                (index) => productViewTile(index, product: widget.products),
              )
            ])
          ],
        ),
      ),
    );
  }

  Widget productViewTile(int index, {required Products product}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedIndex = index;
           product.imgUlr=imageList[index] ;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(23),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(
                width: clickedIndex == index ? 2 : 1,
                color: clickedIndex == index ? Colors.green : Colors.blue),
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageList[index]),
        ),
      ),
    );
  }
}
