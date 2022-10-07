import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/application/packages/detail_package_view_model.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/packages/detail_package_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/core/data/package_fake_data.dart';
import '../../infrastructure/mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockIPackageRepository repository;
  late MockIAdvancedService iAdvancedService;
  late IPackageService service;
  late String namePackage;
  late DetailPackageViewModel viewModel;

  setUp(() {
    repository = MockIPackageRepository();
    service = BasePackageService(repository);
    iAdvancedService = MockIAdvancedService();
    viewModel = DetailPackageViewModel(service, iAdvancedService);
    namePackage = 'avatar_letter';
  });

  Widget createWidgetForTest() {
    return MaterialApp(
      theme: lightTheme(),
      home: DetailPackageScreen(namePackage, viewModel),
    );
  }

  testWidgets('test has data for detail', (tester) async {
    when(repository.getPackageName(packageName: namePackage))
        .thenAnswer((_) async => Right(defaultPackage));

    when(repository.getMetricPackage(package: namePackage))
        .thenAnswer((_) async => Right(defaultMetric));

    when(repository.getPublisher(packageName: namePackage))
        .thenAnswer((_) async => Right('srnunio@default.com'));

    when(iAdvancedService.readFile(
            gitPath: defaultPackage.latest.pubspec.homepage,
            fileName: 'README.md'))
        .thenAnswer((_) async => Right(defaultReadme));

    when(iAdvancedService.readFile(
            gitPath: defaultPackage.latest.pubspec.homepage,
            fileName: 'CHANGELOG.md'))
        .thenAnswer((_) async => Right(defaultReadme));

    await tester.pumpWidget(createWidgetForTest());

    await viewModel.load(namePackage);

    expect(viewModel.hasData, true);
  });
}
