import 'package:get_it/get_it.dart';

import '../../core/core.dart';
import '../data.dart';
import '../responses/product_response.dart';

class ProductRemoteService implements IProductRemoteService {
  late final INetworkUtility _networkUtility;

  ProductRemoteService()
      : _networkUtility = GetIt.I.get<INetworkUtility>(
            instanceName: NetworkConstant.authorizationDomain);

  @override
  Future<ProductModel> getResponse({Map<String, dynamic>? params}) async {
    // final response = await _networkUtility.request('v1/api/dummy_end_point', Method.GET);
    final response = {
      "id": 2,
      "brand": "Aldo",
      "name": "REID Lace-Up Shoes",
      "price": 35.5,
      "discountPrice": 27.99,
      "discountPercent": 33,
      "colors": ["Red", "Blue"],
      "productSize": [
        {
          "name": "us",
          "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
        },
        {
          "name": "vn",
          "size": [38, 39, 40]
        }
      ],
      "description": "REID Lace-Up Shoes Multi",
      "images": [
        "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
        "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
        "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
        "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
        "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
      ],
      "quantity": 10
    };
    return ProductModel.fromJson(response);
  }

  @override
  Future<ProductResponse> searchProduct(String value) async {
    // final response = await _networkUtility.request('v1/api/dummy_end_point', Method.GET);
    Map<String, dynamic> listProduct = {
      "products": [
        {
          "brand": "Aldo",
          "name": "Almond Toe",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
        {
          "brand": "Aldo",
          "name": "REID Lace-Up Shoes Multi",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
        {
          "brand": "Aldo",
          "name": "Prince Albert",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
      ]
    };
    // search demo
    var data = ProductResponse.fromJson(listProduct);
    ProductResponse resultSearch = ProductResponse();
    List<ProductModel> search = [];
    data.listProduct?.forEach((element) {
      if (element.name?.contains(value) ?? false) {
        search.add(element);
      }
    });
    resultSearch.listProduct = List.from(search);
    return resultSearch;
  }

  Future<ProductResponse> getAllProduct() async {
    Map<String, dynamic> listProduct = {
      "products": [
        {
          "brand": "Aldo",
          "name": "Almond Toe",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
        {
          "brand": "Aldo",
          "name": "REID Lace-Up Shoes Multi",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
        {
          "brand": "Aldo",
          "name": "Prince Albert",
          "price": 35.5,
          "discountPrice": 27.99,
          "discountPercent": 33,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
        {
          "brand": "Aldo",
          "name": "Prince Albert",
          "price": 35.5,
          "discountPrice": null,
          "discountPercent": 0,
          "colors": ["Red", "Blue"],
          "productSize": [
            {
              "name": "us",
              "size": [35, 36, 37, 38, 39, 40, 41, 42, 43]
            },
            {
              "name": "vn",
              "size": [38, 39, 40]
            }
          ],
          "description": "REID Lace-Up Shoes Multi",
          "images": [
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
            "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
          ],
          "quantity": 10
        },
      ]
    };

    return ProductResponse.fromJson(listProduct);
  }
}
