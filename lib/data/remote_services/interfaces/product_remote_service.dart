import '../../data.dart';
import '../../responses/product_response.dart';

abstract class IProductRemoteService {
  Future<ProductModel> getResponse({Map<String, dynamic>? params});
  Future<ProductResponse> searchProduct(String value);

  Future<ProductResponse> getAllProduct();
}
