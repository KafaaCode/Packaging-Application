import 'package:dio/dio.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseInitalRemoteDataSource {
  Future<SpecializationAndCountry> getInitalData();
}

class InitalRemoteDataSource extends BaseInitalRemoteDataSource {
  @override
  Future<SpecializationAndCountry> getInitalData() async {
    final response = await Dio().get(
        ApiConstances.sspecializationsAndCountryUrl,
        options: Options(
          headers: ApiConstances.headers(isToken: false),
          validateStatus: (status) => status! < 500,
        ),
       
      );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SpecializationAndCountry.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
