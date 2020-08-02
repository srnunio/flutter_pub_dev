import 'package:equatable/equatable.dart';
import 'package:flutter_package/model/domain/package.dart';

abstract class BlocEvent extends Equatable {}

class Fetch extends BlocEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ResultData extends BlocEvent {
  List<Package> packages;

  ResultData({this.packages});

  @override
  // TODO: implement props
  List<Object> get props => [packages];
}

class Refresh extends BlocEvent {
  List<Package> packages;

  Refresh({this.packages});

  @override
  // TODO: implement props
  List<Object> get props => [packages];
}

class EmptyData extends BlocEvent {
  EmptyData();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
