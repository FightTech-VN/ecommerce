import 'package:ecommerce/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/responsitory/product_responsitory.dart';
import '../datasource/local/mock_data_local.dart';

@Injectable(as: ProductResponsitory)
class ProductResponsitoryImpl extends ProductResponsitory {
  final ProductMockApi _api;

  ProductResponsitoryImpl(this._api);
  @override
  Future<List<Product>> getListProduct() async {
    final result = await _api.getListProduct();
    return result;
  }
}
