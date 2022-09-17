// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:art_wld/data/providers/art_provider.dart';
import 'package:art_wld/utils/repo_res.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/artwork/artwork.dart';

class ArtRepo {
  late ArtApi artApi;
  ArtRepo({
    required this.artApi,
  });
  Future<RepoRes<List<Artwork>>> getFeaturedArtworks(int page) async {
    try {
      final artworks = await artApi.getFeaturedArtworks(page);
      return RepoRes.success(artworks);
    } catch (e) {
      return RepoRes.error(e.toString());
    }
  }
}

final artRepoProvider = Provider<ArtRepo>((ref) {
  return ArtRepo(
    artApi: ref.read(artApiProvider),
  );
});
