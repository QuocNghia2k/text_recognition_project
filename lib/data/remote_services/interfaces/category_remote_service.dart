import '../../responses/category_response.dart';

abstract class ICategoryRemoteService{
  Future<CategoryResponse> getResponse({Map<String, dynamic>? params});
}