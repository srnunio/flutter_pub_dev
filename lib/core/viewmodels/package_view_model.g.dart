// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PackageViewModel on _PackageViewModel, Store {
  final _$packagesAtom = Atom(name: '_PackageViewModel.packages');

  @override
  List<Package> get packages {
    _$packagesAtom.reportRead();
    return super.packages;
  }

  @override
  set packages(List<Package> value) {
    _$packagesAtom.reportWrite(value, super.packages, () {
      super.packages = value;
    });
  }

  final _$_PackageViewModelActionController =
      ActionController(name: '_PackageViewModel');

  @override
  void onPackages(List<Package> packages) {
    final _$actionInfo = _$_PackageViewModelActionController.startAction(
        name: '_PackageViewModel.onPackages');
    try {
      return super.onPackages(packages);
    } finally {
      _$_PackageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
packages: ${packages}
    ''';
  }
}
