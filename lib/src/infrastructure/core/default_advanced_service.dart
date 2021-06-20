import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/infrastructure/core/network_builder.dart';

class DefaultAdvancedService extends IAdvancedService {
  @override
  Future<Either<RequestFailure, String>> getReadme({String? gitPath}) async {
    if (gitPath == null || gitPath.isEmpty)
      return Left(RequestFailure.serverError());

    gitPath = gitPath
        .replaceAll('https://github.com/', '')
        .replaceAll('https://', '')
        .replaceAll('tree/', '')
        .replaceAll('master/', '');
    var url = 'https://raw.githubusercontent.com/${gitPath}/master/README.md';

    var network = NetworkBuilder();
    var dio = network.build();

    var response = await dio
        .getUri(Uri.parse(url))
        .then((value) => (value.data))
        .catchError((onError) => null);

    var readme = (response != null &&
        response.toString().trim() != '404: Not Found' &&
        response.toString().trim() != '400: Invalid request');


    return (readme) ? Right(response) : Left(RequestFailure.serverError());
  }
}
