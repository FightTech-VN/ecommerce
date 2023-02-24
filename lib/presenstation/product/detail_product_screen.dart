import 'package:ecommerce/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../core/components/widgets/banner/banner_carousel_widget.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  Product get product => widget.product;

  @override
  Widget build(BuildContext context) {
    product.images.removeWhere((element) => element == product.image);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                BannerCarouselSliderWidget(
                  ratio: 400 / 400,
                  banners: [
                    product.image,
                    ...product.images,
                  ],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
                  fit: BoxFit.contain,
                  inactiveIndicatorColor: Colors.grey[300],
                  activeIndicatorColor: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.paid,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            product.price.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        product.description,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: Navigator.of(context).pop,
            ),
          ),
        ],
      ),
    );
  }
}
