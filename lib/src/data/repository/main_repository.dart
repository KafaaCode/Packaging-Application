import 'package:dartz/dartz.dart';
import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/main/main_remote_data_source.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';
import 'package:frip_trading/core/error/exceptions.dart';
import 'package:frip_trading/core/error/failure.dart';

class MainRepository extends BaseMainRepository {
  final BaseMainRemoteDataSource mainRemoteDataSource;

  MainRepository({required this.mainRemoteDataSource});

  @override
  ResultFuture<List<Category>> getCategoies() async {
    try {
      final response = await mainRemoteDataSource.getCategories();
      return Right(response);
    } on AuthException catch (failure) {
      return Left(
          ServerFailure.fromResponse(statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultFuture<List<Product>> getProducts({required int categoryId}) async {
    try {
      final response =
          await mainRemoteDataSource.getProducts(categoryId: categoryId);
      return Right(response);
    } on AuthException catch (failure) {
      return Left(
          ServerFailure.fromResponse(statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultFuture<List<MyOrder>> getmyOrders() async {
    try {
      final response = await mainRemoteDataSource.getmyOrders();
      return Right(response);
    } on AuthException catch (failure) {
      return Left(
          ServerFailure.fromResponse(statusCode: failure.statusCode ?? 404));
    }
  }

  @override
  ResultFuture<void> sendSupport(
      {required String title,
      required String message,
      required String senderName,
      required String senderEmail}) async {
    try {
      final response = await mainRemoteDataSource.sendSupport(
        title: title,
        message: message,
        senderName: senderName,
        senderEmail: senderEmail,
      );
      return const Right(unit);
    } on AuthException catch (failure) {
      return Left(
          ServerFailure.fromResponse(statusCode: failure.statusCode ?? 404));
    }
  }
  
  @override
  ResultFuture<void> addOrder({required Map<String, dynamic> orderData})async {
    try {
      final response = await mainRemoteDataSource.sendOrder(orderData);
      return const Right(unit);
    } on AuthException catch (failure) {
      return Left(
          ServerFailure.fromResponse(statusCode: failure.statusCode ?? 404));
    }
  }
}
