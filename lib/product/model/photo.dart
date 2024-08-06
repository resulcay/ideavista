import 'package:equatable/equatable.dart';
import 'package:ideavista/product/model/dimension.dart';

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
