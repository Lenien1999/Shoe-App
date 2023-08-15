import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShorpingCart extends StatelessWidget {
  const ShorpingCart({super.key});

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
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 3,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Expanded(
                      child: Slidable(
                        key: const ValueKey(1),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {}),
                          children: [
                            SlidableAction(
                              onPressed: (BuildContext context) {},
                              backgroundColor: Color(0xFFFE4A49),
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
                                  color:
                                      const Color.fromARGB(255, 214, 203, 203),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Image.asset(
                                "assets/images/three.png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Jordan petrol shoe",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "\$50",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.black),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color.fromARGB(
                                                  255, 207, 198, 198)),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white),
                                                child: const Icon(Icons.remove),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Text("1"),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
