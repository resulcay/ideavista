import 'package:equatable/equatable.dart';

class ImageResponse with EquatableMixin {
  ImageResponse({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) {
    return ImageResponse(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int?,
      nextPage: json['next_page'] as String?,
      prevPage: json['prev_page'] as String?,
    );
  }
  int? page;
  int? perPage;
  List<Photo>? photos;
  int? totalResults;
  String? nextPage;
  String? prevPage;

  @override
  List<Object?> get props =>
      [page, perPage, photos, totalResults, nextPage, prevPage];

  ImageResponse copyWith({
    int? page,
    int? perPage,
    List<Photo>? photos,
    int? totalResults,
    String? nextPage,
    String? prevPage,
  }) {
    return ImageResponse(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      photos: photos ?? this.photos,
      totalResults: totalResults ?? this.totalResults,
      nextPage: nextPage ?? this.nextPage,
      prevPage: prevPage ?? this.prevPage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'photos': photos,
      'total_results': totalResults,
      'next_page': nextPage,
      'prev_page': prevPage,
    };
  }
}

class Photo with EquatableMixin {
  Photo({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographerUrl: json['photographer_url'] as String?,
      photographerId: json['photographer_id'] as int?,
      avgColor: json['avg_color'] as String?,
      src: json['src'] == null
          ? null
          : Dimenson.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool?,
      alt: json['alt'] as String?,
    );
  }
  int? id;
  int? width;
  int? height;
  String? url;
  String? photographer;
  String? photographerUrl;
  int? photographerId;
  String? avgColor;
  Dimenson? src;
  bool? liked;
  String? alt;

  @override
  List<Object?> get props => [
        id,
        width,
        height,
        url,
        photographer,
        photographerUrl,
        photographerId,
        avgColor,
        src,
        liked,
        alt,
      ];

  Photo copyWith({
    int? id,
    int? width,
    int? height,
    String? url,
    String? photographer,
    String? photographerUrl,
    int? photographerId,
    String? avgColor,
    Dimenson? src,
    bool? liked,
    String? alt,
  }) {
    return Photo(
      id: id ?? this.id,
      width: width ?? this.width,
      height: height ?? this.height,
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
      photographerUrl: photographerUrl ?? this.photographerUrl,
      photographerId: photographerId ?? this.photographerId,
      avgColor: avgColor ?? this.avgColor,
      src: src ?? this.src,
      liked: liked ?? this.liked,
      alt: alt ?? this.alt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': src,
      'liked': liked,
      'alt': alt,
    };
  }
}

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
