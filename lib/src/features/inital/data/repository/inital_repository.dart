import 'package:dartz/dartz.dart';
import 'package:frip_trading/core/error/failure.dart';
import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/features/inital/data/data_source/inital_remote_data_source.dart';
import 'package:frip_trading/src/features/inital/domain/repository/inital_repository.dart';

class InitalRepository extends BaseInitalRepository {
  final BaseInitalRemoteDataSource remoteDataSource;
  InitalRepository(this.remoteDataSource);
  @override
  ResultFuture<SpecializationAndCountry> getInitalData() async {
    try {
      final result = await remoteDataSource.getInitalData();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
          statusCode: 400,
        ),
      );
    }
  }
}
