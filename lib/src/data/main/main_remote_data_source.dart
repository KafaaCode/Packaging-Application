import 'package:dio/dio.dart';

import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseMainRemoteDataSource {
  Future<List<Category>> getCategories();
  
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



 

 

 
 

}