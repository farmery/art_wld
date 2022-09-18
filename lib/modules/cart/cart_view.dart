import 'package:art_wld/global_widgets/btn.dart';
import 'package:art_wld/modules/cart/cart_vm.dart';
import 'package:art_wld/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import 'components/cart_item.dart';

class CartView extends ConsumerWidget {
  const CartView({Key? key}) : super(key: key);

  static Route get route => PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: const CartView(),
          );
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartVm = ref.read(cartVmProvider.notifier);
    final artworksInCart = ref.watch(cartVmProvider);
    final colors = AppColors();
    final currency = NumberFormat("#,##0.00", "en_US");

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: artworksInCart.isEmpty
          ? Align(
              alignment: Alignment.topCenter,
              child: Lottie.asset('assets/images/empty_cart.json', height: 300))
          : Column(
              children: [
                Expanded(
                  child: AnimatedList(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    initialItemCount: artworksInCart.length,
                    itemBuilder: (context, index, a) {
                      final artwork = artworksInCart[index];
                      final listHandle = AnimatedList.of(context);
                      return SizeTransition(
                        sizeFactor: a,
                        child: CartItem(
                          onDelete: () {
                            listHandle.removeItem(
                              index,
                              (context, animation) => SizeTransition(
                                sizeFactor: animation,
                                child: CartItem(
                                  key: ValueKey(index),
                                  artwork: artwork,
                                  cartVm: cartVm,
                                ),
                              ),
                            );
                          },
                          key: ValueKey(index),
                          artwork: artwork,
                          cartVm: cartVm,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Btn(
                    label: 'Checkout \$${currency.format(cartVm.totalPrice)}',
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
    );
  }
}
