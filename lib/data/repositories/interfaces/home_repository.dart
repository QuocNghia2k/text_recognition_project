import 'package:dartz/dartz.dart';

import '../../responses/category_response.dart';
import '../../../core/error/failures.dart';

abstract class IHomeRepository{
   Future<Either<Failure, CategoryResponse>> getResponse({Map<String, dynamic>? params});
}