import 'package:ecommerce/domain/responsitory/product_responsitory.dart';
import 'package:injectable/injectable.dart';

import '../entities/product.dart';

@injectable
class ProductUsecase {
  final ProductResponsitory _responsitory;

  ProductUsecase(this._responsitory);

  Future<List<Product>> getListProduct() {
    return _responsitory.getListProduct();
  }
}
