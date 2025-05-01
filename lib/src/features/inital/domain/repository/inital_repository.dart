import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseInitalRepository {
  ResultFuture<SpecializationAndCountry> getInitalData();
}