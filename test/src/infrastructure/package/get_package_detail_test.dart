import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../core/data/package_fake_data.dart';
import '../mocks.mocks.dart';

void main() {
  late MockIPackageRepository mockIPackageRepository;
  late IPackageService iPackageService;
  late String namePackage;

  setUp(() {
    mockIPackageRepository = MockIPackageRepository();
    iPackageService = BasePackageService(mockIPackageRepository);
    namePackage = 'avatar_letter';
  });

  test('when get package detail is successfully', () async {
    when(mockIPackageRepository.getPackageName(namePackage: namePackage))
        .thenAnswer((_) async => Right(defaultPackage));

    var result = await iPackageService.getPackageName(namePackage: namePackage);

    expect(result, equals(Right(defaultPackage)));
  });

  test('when get package detail has failure', () async {
    when(mockIPackageRepository.getPackageName(namePackage: namePackage))
        .thenAnswer((_) async => Left(RequestFailure.serverError()));

    var result = await iPackageService.getPackageName(namePackage: namePackage);

    expect(result, equals(Left(RequestFailure.serverError())));
  });

  test('get metric of package', () async {
    when(mockIPackageRepository.getMetricPackage(package: namePackage))
        .thenAnswer((_) async => Right(defaultMetric));

    var result = await iPackageService.getMetricPackage(package: namePackage);

    expect(result, equals(Right(defaultMetric)));
  });
}
