import '../data.dart';
import 'package:get_it/get_it.dart';

import '../../core/core.dart';

class CategoryRemoteService extends ICategoryRemoteService {
  late final INetworkUtility _networkUtility;

  CategoryRemoteService()
      : _networkUtility = GetIt.I.get<INetworkUtility>(
            instanceName: NetworkConstant.authorizationDomain);
  @override
  Future<CategoryResponse> getResponse({Map<String, dynamic>? params}) async {
    Map<String, dynamic> listCategory = {
      "category": [
        {
          "name": "For Her",
          "urlImage":
              "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          "option": [
            {
              "name": "FOOTWEAR",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "HANDBAGS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "ACCESSORIES",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "COLLECTIONS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            }
          ]
        },
        {
          "name": "For Him",
          "urlImage":
              "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          "option": [
            {
              "name": "FOOTWEAR",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "HANDBAGS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "ACCESSORIES",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "COLLECTIONS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            }
          ]
        },
        {
          "name": "Kids",
          "urlImage":
              "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          "option": [
            {
              "name": "FOOTWEAR",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "HANDBAGS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "ACCESSORIES",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "COLLECTIONS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            }
          ]
        },
        {
          "name": "Sale",
          "urlImage":
              "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
          "option": [
            {
              "name": "FOOTWEAR",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "HANDBAGS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "ACCESSORIES",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            },
            {
              "name": "COLLECTIONS",
              "topic": [
                "Ramadan Collection",
                "Best Sellers",
                "Aldo Premium Handbag Collection",
                "Occasion Collection",
                "Love Planet",
                "New Season Launch"
              ]
            }
          ]
        }
      ]
    };

    return CategoryResponse.fromJson(listCategory);
  }
}
