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
  List<Products> cartProduct = [];
  bool isSelected = false;
  bool isSelectedbutton = false;
  int clickedIndex = 0;
  int sizeclickedIndex = 0;
  List shoeSize = [4, 4.5, 5, 5.5, 6];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, bottom: 12, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height * 1.4 / 3,
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
                  (index) => Expanded(
                      child: productViewTile(index, product: widget.products)),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.products.title,
                    style: GoogleFonts.adamina(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 213, 213)),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        icon: isSelected
                            ? Icon(
                                Icons.favorite_border,
                                color: isSelected ? Colors.grey : Colors.red,
                              )
                            : Icon(
                                Icons.favorite,
                                color: isSelected ? Colors.grey : Colors.red,
                              )),
                  )
                ],
              ),
              Text(
                "\$ ${widget.products.price.toString()}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 243, 240, 240),
                        ),
                        color: Colors.white),
                    child: const Text("5 Piars Left",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 243, 240, 240),
                        ),
                        color: Colors.white),
                    child: const Text(
                      "Sold 50",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 243, 240, 240),
                        ),
                        color: Colors.white),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text("4.9",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("(69 review)"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Divider(
                height: 2,
                color: Colors.grey.shade200,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Size",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Size Chart",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                      shoeSize.length,
                      (index) => buildSize(
                            index: index,
                          ))
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Colors.green,
                              ),
                              color: Colors.white),
                          child: const Center(
                              child: Icon(
                            Icons.message,
                            color: Colors.green,
                          )),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cartProduct.add(widget.products);
                              isSelectedbutton = !isSelectedbutton;
                            });
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                color: isSelectedbutton
                                    ? Colors.green
                                    : Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  isSelectedbutton
                                      ? Icons.done_outlined
                                      : Icons.shopping_cart_outlined,
                                  color: isSelectedbutton
                                      ? Colors.white
                                      : Colors.green,
                                ),
                                isSelectedbutton
                                    ? Text(
                                        "Added",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelectedbutton
                                                ? Colors.white
                                                : Colors.green),
                                      )
                                    : const Text("Add to cart")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (__) {
                            //   return ShorpingCart(
                            //     cartproduct: cartProduct,
                            //   );
                            // }));
                          },
                          child: Container(
                            width: 140,
                            // padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                color: Colors.green),
                            child: const Center(
                                child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productViewTile(int index, {required Products product}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          clickedIndex = index;
          product.imgUlr = imageList[index];
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

  Widget buildSize({
    required index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          sizeclickedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            border: Border.all(
              width: 2,
              color: const Color.fromARGB(255, 243, 240, 240),
            ),
            color: sizeclickedIndex == index ? Colors.green : Colors.white),
        child: Center(
          child: Text("US ${shoeSize[index]}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      sizeclickedIndex == index ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
