import 'dart:core';
import 'package:flutter_package/core/services/api.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/model/bloc_package_data.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:mobx/mobx.dart';
import 'base_view_model.dart';

part 'package_details_view_model.g.dart';

class PackageDetailsViewModel = _PackageDetailsViewModel
    with _$PackageDetailsViewModel;

abstract class _PackageDetailsViewModel extends BaseModel with Store {
  Api _api = Api();
  @observable
  Package package;
  @observable
  String readmeValue;

  bool get isData => (package.versions != null && package.versions.isNotEmpty);

  @action
  void onPackage(Package package) {
    this.package = package;
  }

  @action
  void onReadme(String value) {
    this.readmeValue = value;
  }

  void process() async {
    setBusy(true);
    var newPackage = await _api.getOnePackage(namePackage: package.name);
    if (newPackage != null) {
      onPackage(newPackage);
      var value = await _api.readme(gitPath: newPackage.latest.pubspec.homepage);
      onReadme(value
          .toString()
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(',', '\n'));
    }
    setBusy(false);
  }

  void onRefresh() async {
    if (!await Utils.isConection()) {
      Utils.messageToast(message: 'no_internet_access', reference: true);
      loadState(value: false);
      return;
    }
  }

  void onLoading() async {
    if (!await Utils.isConection()) {
      Utils.messageToast(message: 'no_internet_access', reference: true);
      loadState(value: false);
      return;
    }
  }
}
