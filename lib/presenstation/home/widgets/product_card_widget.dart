import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../domain/entities/product.dart';
import '../../product/detail_product_screen.dart';

enum CardType { left, right }

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    this.type = CardType.left,
  });

  final Product product;
  final CardType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: type == CardType.right
                ? const Radius.circular(20)
                : const Radius.circular(0),
            topLeft: type == CardType.right
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomLeft: type == CardType.left
                ? const Radius.circular(20)
                : const Radius.circular(0),
            topRight: type == CardType.left
                ? const Radius.circular(20)
                : const Radius.circular(0),
          ),
        ),
        elevation: 3,
        color: const Color(0xFFF4EdE0),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => _onTapOpenDetailProduct(context),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: ImageWidget(
                    product.image,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTapOpenDetailProduct(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailProductScreen(product: product),
    ));
  }
}
