import 'package:ideavista/model/photo.dart';

abstract class DioInterface {
  Future<List<Photo>?> fetchPhotos({
    String query = 'random',
    int perPage = 15,
  });

  Future<List<Photo>?> fetchPhotoById({
    int pageId = 1,
    int perPage = 15,
  });
}
