import 'package:ecommerce/domain/entities/product.dart';

abstract class ProductResponsitory {
  Future<List<Product>> getListProduct();
}
