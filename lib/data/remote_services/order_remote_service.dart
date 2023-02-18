import 'package:get_it/get_it.dart';
import '../../core/core.dart';
import '../data.dart';

class OrderRemoteService implements IOrderRemoteService {
  late final INetworkUtility _networkUtility;

  OrderRemoteService()
      : _networkUtility = GetIt.I.get<INetworkUtility>(
            instanceName: NetworkConstant.authorizationDomain);

  @override
  Future<OrderModel> getOrder(String token) async {
    // final response = await _networkUtility.request('v1/api/dummy_end_point', Method.GET);
    final response = {
      "id": 1,
      "subTotal": 126.57,
      "total": 125.52,
      "discount": 21.31,
      "feeShip": 75.0,
      "status": "",
      "createAt": "",
      "description": "",
      "tokenDiscount": "",
      "orderDetails": [
        {
          "id": 1,
          "quantity": 3,
          "price": 100.0,
          "orderSize": {"name": "us", "size": 37},
          "product": {
            "id": 1,
            "brand": "Aldo",
            "name": "REID Lace-Up Shoes",
            "price": 35.5,
            "discountPrice": 27.99,
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
              "https://img.ltwebstatic.com/images3_pi/2021/01/11/1610335023cd248cab776a70890cf0f5b3e02ee0ab_thumbnail_600x.webp",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
            ],
            "quantity": 10,
            "selectedSize": 30
          }
        },
        {
          "id": 2,
          "quantity": 2,
          "price": 100.0,
          "orderSize": {"name": "vn", "size": 38},
          "product": {
            "id": 1,
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
            "quantity": 10,
            "selectedSize": 30
          }
        },
        {
          "id": 3,
          "quantity": 3,
          "price": 100.0,
          "orderSize": {"name": "us", "size": 37},
          "product": {
            "id": 1,
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
              "https://img.ltwebstatic.com/images3_pi/2021/01/11/1610335023cd248cab776a70890cf0f5b3e02ee0ab_thumbnail_600x.webp",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43",
              "https://cf.shopee.vn/file/52f2a509c89409192f2ac4397d070a43"
            ],
            "quantity": 10,
            "selectedSize": 30
          }
        },
        {
          "id": 4,
          "quantity": 2,
          "price": 100.0,
          "orderSize": {"name": "vn", "size": 38},
          "product": {
            "id": 1,
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
            "quantity": 10,
            "selectedSize": 30
          }
        }
      ],
      "user": {
        "id": "1",
        "name": "nghia",
        "email": "nghia@gmail.com",
        "phoneNumber": "0123456789",
        "urlProfile":
            "http://dev.lecle.vn:9004/uploads/url_Profile_e74108c475.png?updated_at=2022-11-02T07:36:28.354Z"
      },
    };
    return OrderModel.fromJson(response);
  }
}
