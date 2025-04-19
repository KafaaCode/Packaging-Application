
import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseMainRepository {
  ResultFuture<List<Category>> getCategoies();
 ResultFuture<List<Product>> getProducts({required int categoryId});
 ResultFuture<List<MyOrder>> getmyOrders();
}
