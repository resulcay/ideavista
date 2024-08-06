import 'package:equatable/equatable.dart';
import 'package:ideavista/product/model/photo.dart';

final class HomeViewState extends Equatable {
  const HomeViewState({
    required this.isLoading,
    required this.photos,
  });

  final bool isLoading;
  final List<Photo>? photos;

  @override
  List<Object?> get props => [
        isLoading,
        photos,
      ];

  HomeViewState copyWith({bool? isLoading, List<Photo>? photos}) {
    return HomeViewState(
      isLoading: isLoading ?? this.isLoading,
      photos: photos ?? this.photos,
    );
  }
}
