import 'package:frip_trading/admin/screens/categories/category_model.dart';
import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseMainRepository {
  ResultFuture<List<CategoryModel>> getCategoies();
  ResultFuture<List<Product>> getProducts({required int categoryId});
  ResultFuture<List<MyOrder>> getmyOrders();
  ResultFuture<void> sendSupport(
      {required String title,
      required String message,
      required String senderName,
      required String senderEmail});
  ResultFuture<void> addOrder({
    required Map<String, dynamic> orderData,
  });
}
