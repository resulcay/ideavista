import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ideavista/product/dto/photo_dto.dart';
import 'package:ideavista/product/model/photo.dart';
import 'package:ideavista/product/network/dio_interface.dart';
import 'package:ideavista/product/env/env_manager.dart';
import 'package:logger/logger.dart';

class DioManager implements DioInterface {
  DioManager() {
    _dio.options = options;
  }

  final Dio _dio = Dio();
  static final String _apiKey = EnvManager.apiKey;
  static final String _imageBaseUrl = EnvManager.imageBaseUrl;
  //static final String _videoBaseUrl = EnvManager.videoBaseUrl;

  static final options = BaseOptions(
    baseUrl: _imageBaseUrl,
    headers: {HttpHeaders.authorizationHeader: _apiKey},
  );

  @override
  Future<List<Photo>?> fetchPhotos({
    String query = 'random',
    int perPage = 15,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        'search',
        queryParameters: {
          'query': query,
          'per_page': perPage,
        },
      );

      final photoDTO = PhotoDTO.fromJson(response.data!);
      return photoDTO.photos;
    } catch (error) {
      Logger().e(error);
      return null;
    }
  }

  @override
  Future<List<Photo>?> fetchPhotoById({int pageId = 1, int perPage = 15}) {
    throw UnimplementedError();
  }
}
