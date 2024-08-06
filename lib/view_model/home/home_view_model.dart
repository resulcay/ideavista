import 'package:ideavista/product/base/base_cubit.dart';
import 'package:ideavista/product/network/dio_manager.dart';
import 'package:ideavista/view_model/home/home_view_state.dart';

class HomeViewModel extends BaseCubit<HomeViewState> {
  HomeViewModel()
      : super(
          const HomeViewState(
            isLoading: false,
            photos: [],
          ),
        );

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> getPhotos() async {
    final photos = await DioManager().fetchPhotos();
    emit(state.copyWith(photos: photos));
  }
}
