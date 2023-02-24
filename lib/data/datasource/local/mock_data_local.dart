import 'package:injectable/injectable.dart';

import '../../../domain/entities/product.dart';
import 'mocks/products.dart';

@injectable
class ProductMockApi {
  Future<List<Product>> getListProduct() {
    final listProduct = kListProduct
        .map((e) => Product.formJson(Map<String, dynamic>.from(e)))
        .toList();
    return Future.value(listProduct);
  }
}
