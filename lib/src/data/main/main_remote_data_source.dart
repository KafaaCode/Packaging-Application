import 'package:dio/dio.dart';

import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseMainRemoteDataSource {
  Future<List<Category>> getCategories();
    Future<List<MyOrder>> getmyOrders();
  Future<List<Product>> getProducts({required int categoryId});

}

class MainRemoteDataSource extends BaseMainRemoteDataSource {
  final Dio _dio = Dio();

  MainRemoteDataSource();

  @override
  Future<List<Category>> getCategories() async {
    return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.get(
            ApiConstances.getcategoriesUrl,
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            final List<dynamic> categoryList = response.data['data'];
               return categoryList
                .map((category) => Category.fromJson(category as Map<String, dynamic>))
                .toList();
          
          },
    
        );
  }
  
  @override
  Future<List<Product>> getProducts({required int categoryId}) {
  return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.get(
            ApiConstances.getproductsUrl(categoryId: categoryId),
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            final List products = response.data['data'] ?? [];

            return products.map((product) => Product.fromJson(product as Map<String, dynamic>)).toList();
          },
        );
  }



  @override
  Future<List<MyOrder>> getmyOrders() async {
    return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.get(
            ApiConstances.getordersUrl,
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            final List<dynamic> myorderList = response.data['data'];
               return myorderList
                .map((myorder) => MyOrder.fromJson(myorder as Map<String, dynamic>))
                .toList();
          
          },
    
        );
  }

 

 
 

}