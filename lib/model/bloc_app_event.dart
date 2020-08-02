import 'package:equatable/equatable.dart';
import 'package:flutter_package/model/domain/package.dart';

abstract class BlocAppEvent extends Equatable {}

class AppInit extends BlocAppEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DarkModeOff extends BlocAppEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DarkModeOn extends BlocAppEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
