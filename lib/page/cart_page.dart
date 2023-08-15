import 'package:flutter/material.dart';

class ShorpingCart extends StatelessWidget {
  const ShorpingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
    );
  }
}
