import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/application/packages/detail_package_view_model.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/core/default_advanced_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../infrastructure/core/data/package_fake_data.dart';
import '../../infrastructure/mocks.mocks.dart';

void main() {

  late MockIPackageRepository repository;

  late IPackageService service;

  late DetailPackageViewModel viewModel;

  setUp(() {
    repository = MockIPackageRepository();
    service = BasePackageService(repository);
    viewModel = DetailPackageViewModel(service, DefaultAdvancedService());
  });

  test('change state when get package is successfully', () async {
    var name = 'avatar_letter';
    when(repository.getPackageName(namePackage: name))
        .thenAnswer((_) async => Right(defaultPackage));

    when(repository.getMetricPackage(package: name))
        .thenAnswer((_) async => Right(defaultMetric));

    expect(viewModel.hasData, false);

    await viewModel.load(name);

    expect(viewModel.hasData, true);

    expect(viewModel.package, equals(defaultPackage));
  });

  test('change state when get package has fail', () async {
    var name = 'avatar_letter';
    when(repository.getPackageName(namePackage: name))
        .thenAnswer((_) async => Left(RequestFailure.empty()));

    when(repository.getMetricPackage(package: name))
        .thenAnswer((_) async => Left(RequestFailure.empty()));

    expect(viewModel.hasError, false);

    await viewModel.load(name);

    expect(viewModel.hasError, true);
  });
}
