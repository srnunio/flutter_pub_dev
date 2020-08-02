import 'package:equatable/equatable.dart';
import 'package:flutter_package/model/domain/package.dart';

abstract class BlocState extends Equatable {
  BlocState([List props = const []]) : super();
}

class Uninitialized extends BlocState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ObjectEmptyState extends BlocState {
  @override
  // TODO: implement props
  List<Object> get props => null;
}


class ObjectLoaded extends BlocState {
  List<Package> packages;
  bool hasReachedMax;

  List<Package> values() {
    return List<Package>();
  }

  addList(List<Package> objects) {
    this.packages = objects;
  }

  ObjectLoaded({
    this.packages,
    this.hasReachedMax,
  });

  ObjectLoaded copyWith({
    List<Package> posts,
    bool hasReachedMax,
  }) {
    return ObjectLoaded(
      packages: posts ?? this.packages,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [packages, hasReachedMax];

  @override
  String toString() =>
      'ObjectLoaded { packages: ${packages}, hasReachedMax: $hasReachedMax }';
}
