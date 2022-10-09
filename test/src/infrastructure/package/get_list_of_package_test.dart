import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../core/data/package_fake_data.dart';
import '../mocks.mocks.dart';


void main() {
  late MockIPackageRepository repository;
  late IPackageService service;

  setUp(() {
    repository = MockIPackageRepository();
    service = BasePackageService(repository);
  });

  test('when get list of package is successfully', () async {
    var data = [defaultPackage];
    when(repository.getPackages(page: 0)).thenAnswer((_) async => Right(data));
    var result = await service.getPackages(page: 0);
    expect(result, Right(data));
  });

  test('when get list of package is empty', () async {
    when(repository.getPackages(page: 0))
        .thenAnswer((_) async => Left(RequestFailure.empty()));

    var result = await service.getPackages(page: 0);

    expect(result, equals(Left(RequestFailure.empty())));
  });
}
