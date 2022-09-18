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

  int get totalPrice {
    int totalPrice = 0;
    for (var item in state) {
      totalPrice += item.price!;
    }
    return totalPrice;
  }
}

final cartVmProvider = StateNotifierProvider<CartVm, List<Artwork>>((ref) {
  return CartVm();
});
