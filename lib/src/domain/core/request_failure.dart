import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_failure.freezed.dart';

@freezed
abstract class RequestFailure with _$RequestFailure {
  factory RequestFailure.networkError() = _NetworkFailure;
  factory RequestFailure.empty() = _Empty;
  factory RequestFailure.serverError() = _ServerError;
}


