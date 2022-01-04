import 'package:flutter_package/src/domain/packages/entities/score.dart';

class Metric {
  final List<String> tags;
  final bool isNullSafe;
  final Score score;

  Metric({
    required this.tags,
    required this.isNullSafe,
    required this.score,
  });

  Map<String, dynamic> toMap() {
    return {
      'platformList': this.tags,
      'isNullSafe': this.isNullSafe,
      'score': this.score.toMap(),
    };
  }

  static Metric get empty =>
      Metric(tags: [], isNullSafe: false, score: Score.default_);
}

extension MetricEx on Metric {
  bool get isNotEmpty => tags.isNotEmpty;
}
