import 'dart:math';

import 'package:art_wld/data/repos/art_repo.dart';
import 'package:art_wld/models/artwork/artwork.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedArtVm extends StateNotifier<List<Artwork>?> {
  final ArtRepo artRepo;
  FeaturedArtVm({required this.artRepo}) : super(null);

  getFeaturedArtworks(int page) async {
    final res = await artRepo.getFeaturedArtworks(page);
    if (res.hasError) {
      return;
    }
    state = [...state ?? [], ...res.data ?? []];
  }
}

final featuredArtVmProvider =
    StateNotifierProvider<FeaturedArtVm, List<Artwork>?>((ref) {
  return FeaturedArtVm(artRepo: ref.read(artRepoProvider));
});

class CollectionsVm extends StateNotifier<List<Artwork>?> {
  final ArtRepo artRepo;
  CollectionsVm({required this.artRepo}) : super(null);

  getCollection() async {
    final res = await artRepo.getFeaturedArtworks(Random().nextInt(50));
    if (res.hasError) {
      return;
    }
    state = [...state ?? [], ...res.data?.getRange(0, 4) ?? []];
  }
}

final collectionsControllerProvider =
    StateNotifierProvider<CollectionsVm, List<Artwork>?>((ref) {
  return CollectionsVm(artRepo: ref.read(artRepoProvider));
});
