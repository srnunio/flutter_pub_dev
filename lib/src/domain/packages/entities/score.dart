import 'package:flutter/material.dart';

class Score {
  final int grantedPoints;
  final int maxPoints;
  final int likeCount;
  final double popularityScore;

  const Score(
      {@required this.maxPoints,
      @required this.grantedPoints,
      @required this.likeCount,
      @required this.popularityScore});

  factory Score.fromMap(Map<String, dynamic> map) {
    return new Score(
      maxPoints: map['maxPoints'] as int,
      grantedPoints: map['grantedPoints'] as int,
      likeCount: map['likeCount'] as int,
      popularityScore: map['popularityScore'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'maxPoints': this.maxPoints,
      'likeCount': this.likeCount,
      'popularityScore': this.popularityScore,
      'grantedPoints': this.grantedPoints,
    } as Map<String, dynamic>;
  }

  static Score get default_ =>
      Score(maxPoints: 0, popularityScore: 0.0, likeCount: 0, grantedPoints: 0);
}

extension Scorex on Score {
  String getPopularity() {
    var result = (popularityScore * 100).roundToDouble();
    return '${result}%';
  }
}
