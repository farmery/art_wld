import 'package:art_wld/utils/api_consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/artwork/artwork.dart';
import '../../utils/secret.dart';

class ArtApi {
  final Dio _client = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  Future<List<Artwork>> getFeaturedArtworks(int page) async {
    try {
      final res =
          await _client.get('$getArtworks&page=$page&client_id=$apiKey');
      final Iterable iArtworks = res.data['results'];
      List<Artwork> artworks =
          iArtworks.map((e) => Artwork.fromMap(e)).toList();
      return artworks;
    } catch (e) {
      rethrow;
    }
  }
}

final artApiProvider = Provider<ArtApi>((ref) {
  return ArtApi();
});
