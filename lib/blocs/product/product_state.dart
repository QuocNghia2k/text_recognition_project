import 'package:equatable/equatable.dart';
import '../../data/data.dart';

class ProductState extends Equatable {
  int? indexImageDisplayHeader;
  ProductModel? product;
  int? indexSizeName;
  int? indexSize;

  ProductState(
      {ProductState? state,
      int? indexImageDisplayHeader,
      ProductModel? product,
      int? indexSizeName,
      int? indexSize})
      : indexImageDisplayHeader =
            indexImageDisplayHeader ?? state?.indexImageDisplayHeader,
        product = product ?? state?.product,
        indexSizeName = indexSizeName ?? state?.indexSizeName,
        indexSize = indexSize ?? state?.indexSize;

  @override
  List<Object?> get props =>
      [indexImageDisplayHeader, product, indexSizeName, indexSize];
}
