class Products {
  final int id;
  final String title;
  final String description;
  String imgUlr;
  final double price;
  final int quantity;

  Products(
      {this.quantity = 1,
      required this.id,
      required this.title,
      required this.description,
      required this.imgUlr,
      required this.price});
}

final productItems = <Products>[
  Products(
      id: 1,
      title: "jordan Retro High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/one.jpg',
      price: 20.0),
  Products(
      id: 2,
      title: "Addidas link High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/two.png',
      price: 50.0),
  Products(
      id: 3,
      title: "vivan dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/three.png',
      price: 70.0),
  Products(
      id: 4,
      title: "Nike canva",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/four.png',
      price: 20.0),
  Products(
      id: 5,
      title: "jordanh dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/addidas.png',
      price: 70.0),
  Products(
      id: 6,
      title: "jordan Retro High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/one.jpg',
      price: 20.0),
];
