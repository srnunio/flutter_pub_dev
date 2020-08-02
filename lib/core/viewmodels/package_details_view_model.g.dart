// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PackageDetailsViewModel on _PackageDetailsViewModel, Store {
  final _$packageAtom = Atom(name: '_PackageDetailsViewModel.package');

  @override
  Package get package {
    _$packageAtom.reportRead();
    return super.package;
  }

  @override
  set package(Package value) {
    _$packageAtom.reportWrite(value, super.package, () {
      super.package = value;
    });
  }

  final _$readmeValueAtom = Atom(name: '_PackageDetailsViewModel.readmeValue');

  @override
  String get readmeValue {
    _$readmeValueAtom.reportRead();
    return super.readmeValue;
  }

  @override
  set readmeValue(String value) {
    _$readmeValueAtom.reportWrite(value, super.readmeValue, () {
      super.readmeValue = value;
    });
  }

  final _$_PackageDetailsViewModelActionController =
      ActionController(name: '_PackageDetailsViewModel');

  @override
  void onPackage(Package package) {
    final _$actionInfo = _$_PackageDetailsViewModelActionController.startAction(
        name: '_PackageDetailsViewModel.onPackage');
    try {
      return super.onPackage(package);
    } finally {
      _$_PackageDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onReadme(String value) {
    final _$actionInfo = _$_PackageDetailsViewModelActionController.startAction(
        name: '_PackageDetailsViewModel.onReadme');
    try {
      return super.onReadme(value);
    } finally {
      _$_PackageDetailsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
package: ${package},
readmeValue: ${readmeValue}
    ''';
  }
}
