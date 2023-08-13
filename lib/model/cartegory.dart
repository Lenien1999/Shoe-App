import 'package:shoe_shop/model/product_model.dart';

class Cartegory {
  final String cartegoryName;
  final String description;
  final List<Products> products;

  Cartegory(
      {required this.products,
      required this.cartegoryName,
      required this.description});
}

final cartegory = <Cartegory>[
  Cartegory(products: productItems, cartegoryName: "Addidas", description: ""),
  Cartegory(products: productItems, cartegoryName: "Nike", description: ""),
  Cartegory(products: productItems, cartegoryName: "Vivan", description: ""),
  Cartegory(products: productItems, cartegoryName: "NB", description: ""),
];
