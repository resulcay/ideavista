import 'package:equatable/equatable.dart';
import 'package:ideavista/model/photo.dart';

class PhotoDTO with EquatableMixin {
  PhotoDTO({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  factory PhotoDTO.fromJson(Map<String, dynamic> json) {
    return PhotoDTO(
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

  PhotoDTO copyWith({
    int? page,
    int? perPage,
    List<Photo>? photos,
    int? totalResults,
    String? nextPage,
    String? prevPage,
  }) {
    return PhotoDTO(
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
