import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_package_repository_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late IPackageService _iPackageService;

  setUp(() {
    _iPackageService = BasePackageService(BasePackageRepositoryMock());
  });

  test('when get list of package is not empty', () async {
    var result = await _iPackageService.getPackages(page: 0);
    expect(result is Right, true);
  });

  test('when get package for name is successfully', () async {
    var name = 'regex_builder';
    var result = await _iPackageService.getPackageName(namePackage: name);
    expect(result.isRight(), true);
  });
}
