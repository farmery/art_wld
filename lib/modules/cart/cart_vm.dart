import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/artwork/artwork.dart';

class CartVm extends StateNotifier<List<Artwork>> {
  CartVm() : super([]);
  addItemToCart(Artwork item) {
    if (state.contains(item)) return;
    state = [...state, item];
  }

  removeItemFromCart(Artwork item) {
    state = state.where((element) => element != item).toList();
  }

  clearCart() {
    state = [];
  }
}

final cartVmProvider = StateNotifierProvider<CartVm, List<Artwork>>((ref) {
  return CartVm();
});
