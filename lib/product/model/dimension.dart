import 'package:equatable/equatable.dart';

class Dimenson with EquatableMixin {
  Dimenson({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });
  factory Dimenson.fromJson(Map<String, dynamic> json) {
    return Dimenson(
      original: json['original'] as String?,
      large2x: json['large2x'] as String?,
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      portrait: json['portrait'] as String?,
      landscape: json['landscape'] as String?,
      tiny: json['tiny'] as String?,
    );
  }
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tiny;

  @override
  List<Object?> get props =>
      [original, large2x, large, medium, small, portrait, landscape, tiny];

  Dimenson copyWith({
    String? original,
    String? large2x,
    String? large,
    String? medium,
    String? small,
    String? portrait,
    String? landscape,
    String? tiny,
  }) {
    return Dimenson(
      original: original ?? this.original,
      large2x: large2x ?? this.large2x,
      large: large ?? this.large,
      medium: medium ?? this.medium,
      small: small ?? this.small,
      portrait: portrait ?? this.portrait,
      landscape: landscape ?? this.landscape,
      tiny: tiny ?? this.tiny,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'large2x': large2x,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }
}
