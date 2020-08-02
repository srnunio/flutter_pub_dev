import 'dart:core';
import 'package:flutter_package/core/services/api.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:mobx/mobx.dart';
import 'base_view_model.dart';

part 'package_view_model.g.dart';

class PackageViewModel = _PackageViewModel with _$PackageViewModel;

abstract class _PackageViewModel extends BaseModel with Store {
  Api _api = Api();
  @observable
  List<Package> packages = List<Package>();

  bool get isData => (packages != null && packages.isNotEmpty);

  @action
  void onPackages(List<Package> packages) {
    this.packages = this.packages + packages;
  }
  void onRefresh() async {
    if(!await Utils.isConection()){
      Utils.messageToast(message: 'no_internet_access',reference: true);
      loadState(value: false);
      return;
    }
    _api.initPage();
    readAllPackages(pull: true);
  }

  void onLoading() async {
    if(!await Utils.isConection()){
      Utils.messageToast(message: 'no_internet_access',reference: true);
      loadState(value: false);
      return;
    }
    readAllPackages(pull: false);
  }

  readAllPackages({bool pull = false}) async {
    if (isBusy) {
      return;
    }
    loadState(value: pull);
    setBusy(true);
    var packages = await _api.getAllPackages();
    if (packages.isNotEmpty) {
      onPackages(packages);
    }
    setBusy(false);
    loadState(value: false);
  }
}
