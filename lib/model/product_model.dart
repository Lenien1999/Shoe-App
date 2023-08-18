class Products {
  final int id;
  final String title;
  final String description;
  String imgUlr;
  final double price;
    int quantity;
  bool isSelected, isAdded;

  Products(
      {this.quantity = 1,
      required this.id,
      this.isAdded = false,
      this.isSelected = false,
      required this.title,
      required this.description,
      required this.imgUlr,
      required this.price});
}

final productItems = <Products>[
  Products(
      isAdded: false,
      isSelected: false,
      id: 1,
      title: "jordan Retro High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/one.jpg',
      price: 20.0),
  Products(
      isSelected: false,
      isAdded: false,
      id: 2,
      title: "Addidas link High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/two.png',
      price: 50.0),
  Products(
      id: 3,
      isSelected: false,
      isAdded: false,
      title: "vivan dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/three.png',
      price: 70.0),
  Products(
      isSelected: false,
      isAdded: false,
      id: 4,
      title: "Nike canva",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/four.png',
      price: 20.0),
  Products(
      isSelected: false,
      id: 5,
      isAdded: false,
      title: "jordanh dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/addidas.png',
      price: 70.0),
  Products(
      isSelected: false,
      isAdded: false,
      id: 6,
      title: "jordan Retro High dior",
      description:
          "As the night came, the world became quiet and peaceful. It felt like the whole world was taking a break, enjoying the stillness of the night. ",
      imgUlr: 'assets/images/one.jpg',
      price: 20.0),
];
