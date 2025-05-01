import 'package:equatable/equatable.dart';

abstract class HasIdAndName extends Equatable {
  Object get id;
  String get name;  // non-nullable
}


