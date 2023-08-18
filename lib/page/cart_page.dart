import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shoe_shop/model/product_model.dart';

class ShorpingCart extends StatefulWidget {
  final List<Products> cartProduct;
  const ShorpingCart({super.key, required this.cartProduct});

  @override
  State<ShorpingCart> createState() => _ShorpingCartState();
}

class _ShorpingCartState extends State<ShorpingCart> {
  int addmore = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                      text: const TextSpan(
                          text: "Ship to",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                          children: [
                        TextSpan(
                            text: " Ipapo land",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ])),
                  const Text("Ajegunle, Compound",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green))
                ],
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    for (Products products in widget.cartProduct)
                      Expanded(
                        child: Slidable(
                          key: const ValueKey(0),
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            // dismissible: DismissiblePane(onDismissed: () {}),
                            children: [
                              SlidableAction(
                                onPressed: (BuildContext context) {},
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(12),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 214, 203, 203),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Image.asset(
                                  products.imgUlr,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products.title,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$ ${products.price * addmore}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: const Color.fromARGB(
                                                    255, 207, 198, 198)),
                                            child: Row(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.white),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          products.quantity -=
                                                              1;
                                                        });
                                                      },
                                                      child: const Icon(
                                                          Icons.remove)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(products.quantity
                                                    .toString()),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.green),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        products.quantity += 1;
                                                      });
                                                    },
                                                    child: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    buildBottomPrice(
                        price: '\$30,000', title: 'Sub Total', discount: false),
                    buildBottomPrice(
                        price: '\$30,000',
                        title: 'Delivery Fee',
                        discount: false),
                    buildBottomPrice(
                        price: '-\$30.00', title: 'Discount', discount: true),
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    buildBottomPrice(
                        price: '-\$30.00', title: 'Total', discount: false),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        color: const Color.fromARGB(255, 12, 141, 16),
                      ),
                      child: const Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomPrice(
      {required String title, required String price, required bool discount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: discount ? Colors.green : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
