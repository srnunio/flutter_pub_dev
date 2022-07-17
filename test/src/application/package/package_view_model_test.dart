import 'package:flutter_package/src/application/packages/packages_view_model.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../infrastructure/package/base_package_repository_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late IPackageService _iPackageService;
  late PackagesViewModel _packagesViewModel;

  setUp(() {
    _iPackageService = BasePackageService(BasePackageRepositoryMock());
    _packagesViewModel = PackagesViewModel(_iPackageService);
  });

  test('check if controller has data', () async {
    expect(_packagesViewModel.hasData, false);

    await _packagesViewModel.load();

    expect(_packagesViewModel.hasData, true);
  });
}
